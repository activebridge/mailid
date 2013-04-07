<h1>Mailid</h1> (in the development)

<h2>Installation</h2>
Add to your Gemfile:

```ruby
gem 'mailid'
```

Then run:

```ruby
$ bundle
```

<h2>How to send a message?</h2>

```ruby
#user wants to send a message to another user
a.create_conversation(b, "subject", "body")
```

<h2>How to reply a message?</h2>

```ruby
#user wants to reply to another user
a.reply(conversation, receipt, "subject", "body")
```

<h2>How to forward a conversation?</h2>

```ruby
#user wants to forward a conversation
#get conversation's messages with 
#conversation.forward_body
a.create_conversation(b, "subject", conversation.forward_body)
```

<h2>How to archive/unarchive conversation?</h2>

```ruby
#user wants add conversation to archive
a.mark_as_archived(conversation)

#user wants remove conversation from archive
a.unarchive(conversation)
```

<h2>How can I get my conversations?</h2>

```ruby
#user wants to get all his conversations
a.conversations

#user wants to get his inbox conversations
a.inbox

#user wants to get his sent conversations
a.sentbox

#user wants to get his archived conversations
a.archived
```
