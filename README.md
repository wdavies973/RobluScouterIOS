# Contribution guide
RobluScouterIOS is just a port of https://github.com/wdavies973/RobluScouter.  
There is much to be done. I'll outline what I am working on and what needs to be done.

RobluScouter has 4 major components that need to be constructed:  
- IO (reading and writing objects locally)
- Models (mirrors of the models from RobluScouterIOS, using Swift data structures as opposed to Java)
- Sync (network, bluetooth, and QR. This is the mammoth section. Custom serialization that works between Java and IOS will be difficult)
- UI (UI binds need to be created. The UI should be capable of loading an array of RCheckout models and support changes to RSettings via a UI.

I am primarily working on models & syncing since I am most familiar with the Roblu code base. If you feel like you understand 
the inner workings of Roblu, I would appreciate any help in this area.

UI would be the most useful for me to have someone do at the moment. I'd recommend downloading Roblu Scouter on the Google Play
store and building a UI exactly as that one. Later, I'll be able to hook up the syncing code to your UI.

Otherwise, literally just pick any section of code from RobluScouter (in utils, notifications, whatever) and port it to IOS. 

A few other small notes:
- RGallery won't be included in the first release to save development time. 
- For the time being, only Roblu Scouter is getting ported to IOS
- If anyone has an IOS developer account, I would be interested in borrowing it to post this app when it's done.


Thanks!
Contact: wdavies973@gmail.com
