// Copyright 2016-2018 Cisco Systems Inc
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import ObjectMapper
import Alamofire
import SwiftyJSON

/// The enumeration of Before types in Spark Message Client.
///
/// - since: 1.4.0
public enum Before {
    /// Before one particular message by message Id.
    case message(String)
    /// Before a particular time point by date.
    case date(Date)
}

/// The enumeration of mention types in Spark Message Client.
///
/// - since: 1.4.0
public enum Mention {
    /// Mention one particular person by person Id.
    case person(String)
    /// Mention all people in a room.
    case all
}

/// An iOS client wrapper of the Cisco Spark Message APIs.
///
/// - since: 1.4.0
public class MessageClient {
    
    /// Callback when receive Message.
    ///
    /// - since: 1.4.0
    public var onEvent: ((MessageEvent) -> Void)? {
        get {
            return self.phone.messages?.onEvent
        }
        set {
            self.phone.messages?.onEvent = newValue
        }
    }
    
    private let phone: Phone
    
    private let queue = SerialQueue()
    
    init(phone: Phone) {
        self.phone = phone
    }
    
    /// Lists all messages in a room by room Id.
    /// If present, it includes the associated media content attachment for each message.
    /// The list sorts the messages in descending order by creation date.
    ///
    /// - parameter roomId: The identifier of the room.
    /// - parameter before: If not nil, only list messages sent only before this date and time, in ISO8601 format.
    /// - parameter beforeMessage: If not nil, only list messages sent only before this message by id.
    /// - parameter max: Limit the maximum number of messages in the response, default is 50.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    @available(*, deprecated: 1.4.0, renamed: "list(roomId:before:max:mentionedPeople:queue:completionHandler:)")
    public func list(roomId: String,
                     before: String? = nil,
                     beforeMessage: String? = nil,
                     max: Int? = nil,
                     queue: DispatchQueue? = nil,
                     completionHandler: @escaping (ServiceResponse<[Message]>) -> Void) {
        
        var condition: Before?
        if let beforeMessage = beforeMessage {
            condition = Before.message(beforeMessage)
        }
        else if let before = before, let date = Date.fromISO860(before) {
            condition = Before.date(date)
        }
        self.list(roomId: roomId, before: condition, max: max ?? 50, queue: queue, completionHandler: completionHandler)
    }
    
    /// Lists all messages in a room by room Id.
    /// If present, it includes the associated media content attachment for each message.
    /// The list sorts the messages in descending order by creation date.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter roomId: The identifier of the room.
    /// - parameter before: If not nil, only list messages sent only before this condition.
    /// - parameter max: Limit the maximum number of messages in the response, default is 50.
    /// - parameter mentionedPeople: List messages where the caller is mentioned by using Mention.person("me").
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.4.0
    public func list(roomId: String,
                     before: Before? = nil,
                     max: Int = 50,
                     mentionedPeople: Mention? = nil,
                     queue: DispatchQueue? = nil,
                     completionHandler: @escaping (ServiceResponse<[Message]>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.list(roomId: roomId, mentionedPeople: mentionedPeople, before: before, max: max, queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(error ?? SparkError.unregistered)))
                }
            }
        }
    }
    
    /// Posts a plain text message, and optionally, a media content attachment, to a room by room Id.
    ///
    /// - parameter roomId: The identifier of the room where the message is to be posted.
    /// - parameter text: The plain text message to be posted to the room.
    /// - parameter files: A public URL that Cisco Spark can use to fetch attachments. Currently supports only a single URL. Cisco Spark downloads the content from the URL one time shortly after the message is created and automatically converts it to a format that all Cisco Spark clients can render.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    @available(*, deprecated: 1.4.0, renamed: "post(roomId:text:mentions:files:queue:completionHandler:)")
    public func post(roomId: String, text: String, files: String? = nil, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        if let file = files {
            self.download(from: file) { result in
                if let file = result.data {
                    self.post(roomId: roomId, text: text, mentions: nil, files: [file], queue: queue, completionHandler: completionHandler)
                }
                else {
                    (queue ?? DispatchQueue.main).async {
                        completionHandler(ServiceResponse(nil, Result.failure(result.error ?? MessageClientImpl.MSGError.downloadError)))
                    }
                }
            }
        }
        else {
            self.post(roomId: roomId, text: text, mentions: nil, files: nil, queue: queue, completionHandler: completionHandler)
        }
    }
    
    /// Posts a media content attachment to a room by room Id without text.
    ///
    /// - parameter roomId: The identifier of the room.
    /// - parameter files: A public URL that Cisco Spark can use to fetch attachments. Currently supports only a single URL. Cisco Spark downloads the content from the URL one time shortly after the message is created and automatically converts it to a format that all Cisco Spark clients can render.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    @available(*, deprecated: 1.4.0, renamed: "post(roomId:text:mentions:files:queue:completionHandler:)")
    public func post(roomId: String, files: String, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        self.download(from: files) { result in
            if let file = result.data {
                self.post(roomId: roomId, text: nil, mentions: nil, files: [file], queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(result.error ?? MessageClientImpl.MSGError.downloadError)))
                }
            }
        }
    }
    
    /// Posts a private 1:1 message in plain text, and optionally, a media content attachment, to a person by person Id.
    ///
    /// - parameter personId: The identifier of the recipient of this private 1:1 message.
    /// - parameter text: The plain text message to post to the recipient.
    /// - parameter files: A public URL that Cisco Spark can use to fetch attachments. Currently supports only a single URL. Cisco Spark  downloads the content from the URL one time shortly after the message is created and automatically converts it to a format that all Cisco Spark clients can render.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    @available(*, deprecated: 1.4.0, renamed: "post(personId:text:mentions:files:queue:completionHandler:)")
    public func post(personId: String, text: String, files: String? = nil, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        if let file = files {
            self.download(from: file) { result in
                if let file = result.data {
                    self.post(personId: personId, text: text, files: [file], queue: queue, completionHandler: completionHandler)
                }
                else {
                    (queue ?? DispatchQueue.main).async {
                        completionHandler(ServiceResponse(nil, Result.failure(result.error ?? MessageClientImpl.MSGError.downloadError)))
                    }
                }
            }
        }
        else {
            self.post(personId: personId, text: text, files: nil, queue: queue, completionHandler: completionHandler)
        }
    }
    
    /// Posts a media content attachment to a person by person Id without text.
    ///
    /// - parameter personId: The identifier of the recipient of this media content.
    /// - parameter files: A public URL that Cisco Spark can use to fetch attachments. Currently supports only a single URL. Cisco Spark  downloads the content from the URL one time shortly after the message is created and automatically converts it to a format that all Cisco Spark clients can render.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    @available(*, deprecated: 1.4.0, renamed: "post(personId:text:mentions:files:queue:completionHandler:)")
    public func post(personId: String, files: String, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        self.download(from: files) { result in
            if let file = result.data {
                self.post(personId: personId, text: nil, files: [file], queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(result.error ?? MessageClientImpl.MSGError.downloadError)))
                }
            }
        }
    }
    
    /// Posts a private 1:1 message in plain text, and optionally, a media content attachment, to a person by person Id.
    ///
    /// - parameter personEmail: The email address of the recipient when sending a private 1:1 message.
    /// - parameter text: The plain text message to post to the room.
    /// - parameter files: A public URL that Spark can use to fetch attachments. Currently supports only a single URL. The Spark Cloud downloads the content one time shortly after the message is created and automatically converts it to a format that all Spark clients can render.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    @available(*, deprecated: 1.4.0, renamed: "post(email:text:mentions:files:queue:completionHandler:)")
    public func post(personEmail: EmailAddress, text: String, files: String? = nil, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        if let file = files {
            self.download(from: file) { result in
                if let file = result.data {
                    self.post(personEmail: personEmail, text: text, files: [file], queue: queue, completionHandler: completionHandler)
                }
                else {
                    (queue ?? DispatchQueue.main).async {
                        completionHandler(ServiceResponse(nil, Result.failure(result.error ?? MessageClientImpl.MSGError.downloadError)))
                    }
                }
            }
        }
        else {
            self.post(personEmail: personEmail, text: text, files: nil, queue: queue, completionHandler: completionHandler)
        }
    }
    
    /// Posts a media content attachment to a person by email address without text.
    ///
    /// - parameter personEmail: The email address of the recipient of this media content.
    /// - parameter files: A public URL that Spark can use to fetch attachments. Currently supports only a single URL. The Spark Cloud downloads the content one time shortly after the message is created and automatically converts it to a format that all Spark clients can render.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    @available(*, deprecated: 1.4.0, renamed: "post(email:text:mentions:files:queue:completionHandler:)")
    public func post(personEmail: EmailAddress, files: String, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        self.download(from: files) { result in
            if let file = result.data {
                self.post(personEmail: personEmail, text: nil, files: [file], queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(result.error ?? MessageClientImpl.MSGError.downloadError)))
                }
            }
        }
    }
    
    /// Posts a plain text message, optionally a media content attachment, to a room by user email.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter personEmail: The EmailAddress of the user to whom the message is to be posted.
    /// - parameter content: The plain text message to be posted to the room.
    /// - parameter files: Local file objects to be uploaded to the room.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.4.0
    public func post(personEmail: EmailAddress,
                     text: String? = nil,
                     files: [LocalFile]? = nil,
                     queue: DispatchQueue? = nil,
                     completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.post(person: personEmail.toString(), text: text, files: files, queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(error ?? SparkError.unregistered)))
                }
            }
        }
    }
    
    /// Posts a plain text message, optionally a media content attachment, to a room by person id.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter personId: The personId of the user to whom the message is to be posted.
    /// - parameter text: The plain text message to be posted to the room.
    /// - parameter files: Local file objects to be uploaded to the room.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.4.0
    public func post(personId: String,
                     text: String? = nil,
                     files: [LocalFile]? = nil,
                     queue: DispatchQueue? = nil,
                     completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.post(person: personId, text: text, files: files, queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(error ?? SparkError.unregistered)))
                }
            }
        }
    }
    
    /// Posts a plain text message, optionally a media content attachment, to a room by roomId.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter roomId: The identifier of the room where the message is to be posted.
    /// - parameter text: The plain text message to be posted to the room.
    /// - parameter mentions: The mention items to be posted to the room.
    /// - parameter files: Local file objects to be uploaded to the room.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.4.0
    public func post(roomId: String,
                     text: String? = nil,
                     mentions: [Mention]? = nil,
                     files: [LocalFile]? = nil,
                     queue: DispatchQueue? = nil,
                     completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.post(roomId: roomId, text: text, mentions: mentions, files: files, queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(error ?? SparkError.unregistered)))
                }
            }
        }
    }
    
    /// Detail of one message.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter messageID: The identifier of the message.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    public func get(messageId: String, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Message>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.get(messageId: messageId, decrypt: true, queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(error ?? SparkError.unregistered)))
                }
            }
        }
    }
    
    /// Deletes a message, to a room by messageId.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter messageId: The messageId to be deleted in the room.
    /// - parameter queue: If not nil, the queue on which the completion handler is dispatched. Otherwise, the handler is dispatched on the application's main thread.
    /// - parameter completionHandler: A closure to be executed once the request has finished.
    /// - returns: Void
    /// - since: 1.2.0
    public func delete(messageId: String, queue: DispatchQueue? = nil, completionHandler: @escaping (ServiceResponse<Any>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.delete(messageId: messageId, queue: queue, completionHandler: completionHandler)
            }
            else {
                (queue ?? DispatchQueue.main).async {
                    completionHandler(ServiceResponse(nil, Result.failure(error ?? SparkError.unregistered)))
                }
            }
        }
    }
    
    /// Download a file object, save the file to pointed destination.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter file: The RemoteFile object need to be downloaded.
    /// - parameter to: The local file directory for saving dwonloaded file.
    /// - parameter progressHandler: The download progress indicator.
    /// - parameter completionHandler: Downloaded file local address wiil be stored in "file.localFileUrl"
    /// - returns: Void
    /// - since: 1.4.0
    public func downloadFile(_ file: RemoteFile, to: URL? = nil, progressHandler: ((Double)->Void)? = nil, completionHandler: @escaping (Result<URL>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.downloadFile(file, to: to, progressHandler: progressHandler, completionHandler: completionHandler)
            }
            else {
                (DispatchQueue.main).async {
                    completionHandler(Result.failure(error ?? SparkError.unregistered))
                }
            }
        }
    }
    
    /// Download a file object, save the file thumbnail.
    /// This Api will automatically register phone to websocket, if phone was not been registered before.
    ///
    /// - parameter file: The RemoteFile object need to be downloaded.
    /// - parameter to: The local file directory for saving file after download.
    /// - parameter progressHandler: The download progress indicator.
    /// - parameter completionHandler: Downloaded file local address wiil be stored in "file.localFileUrl"
    /// - returns: Void
    /// - since: 1.4.0
    public func downloadThumbnail(for file: RemoteFile, to: URL? = nil, progressHandler: ((Double)->Void)? = nil, completionHandler: @escaping (Result<URL>) -> Void) {
        self.doSomethingAfterRegistered { error in
            if let impl = self.phone.messages {
                impl.downloadThumbnail(for: file, to: to, progressHandler: progressHandler, completionHandler: completionHandler)
            }
            else {
                (DispatchQueue.main).async {
                    completionHandler(Result.failure(error ?? SparkError.unregistered))
                }
            }
        }
    }
    
    private func download(from: String, completionHandler: @escaping (Result<LocalFile>) -> Void) {
        Alamofire.download(from, to: DownloadRequest.suggestedDownloadDestination()).response { response in
            if response.error == nil, let url = response.destinationURL, let file = LocalFile(path: url.path) {
                completionHandler(Result.success(file))
            }
            else {
                completionHandler(Result.failure(response.error ?? MessageClientImpl.MSGError.downloadError))
            }
        }
    }
    
    private func doSomethingAfterRegistered(block: @escaping (Error?) -> Void) {
        self.queue.sync {
            if self.phone.connected {
                self.queue.yield()
                block(nil)
            }
            else {
                self.phone.register { error in
                    self.queue.yield()
                    block(error)
                }
            }
        }
    }
}


