# Working with sensitive data outside Bianca

It is of course great to store and work with sensitive data on a platform built to satisfy the legal and information security requirements.

But you can't do everything on Bianca. You have to collect the data and upload it there. Perhaps you need to do some post-processing with a Windows-only program. At the very least you should keep a copy of the data elsewhere.

This section describes some common do's and don'ts when it comes to handling sensitive data outside Bianca.

## The basic requirement

Generally, you don't want to keep unencrypted sensitive personal data on a normal, unsecured laptop or USB drive or file server. 

Caveat: Pseudonymised sensitive personal data may be okay to keep in such a place, but not all data can be pseudonymised without destroying its value. Consult your university's information security department for assistance in making this determination.

Encrypted sensitive personal data may also be okay to keep in such a place. 

## Encrypted files and encrypted volumes

You can create an encrypted volume on your computer or a network drive with tools such as Veracrypt and Cryptomator. This gives you a special folder that needs an additional password to be unlocked, so if your USB drive or laptop is accessed by someone untrustworthy the data remains secure. This solution is called an "encrypted volume". 

Encrypted volumes are very practical, because protecting files becomes as easy as moving them. Unfortunately, removing the protection is also as easy as moving the file, which means that it is easy to make a mistake and e.g. accidentally putting files elsewhere as you're working or even uploading unencrypted sensitive files to the Internet. 

You can also encrypt individual files and directories with a tool like 7zip. This gives you a file that needs to be unlocked every time you want to read it. This explicit control over the encryption makes it harder to do the wrong thing by accident, but requires more of an effort. The main benefit of encrypted files may be that they can be shared with other people securely pretty easily.

In all cases, store passwords and encrypted data on separate systems, and keep backups of both also on separate systems.

## Basic advice

We recommend that everyone installs an encrypted volume of some sort on their computer. You never know when it'll come in handy.

Always pseudonymise data if possible, making sure to adequately protect the various versions of the data.

Before working with sensitive data, plan ahead. If you need to put it on a USB drive, how will you ensure that it is protected in case you lose the drive? Where will you work with the data after you're done with Bianca? 

