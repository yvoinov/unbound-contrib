@echo off

rem --------------------------------------------------------------
rem -- Warm up DNS cache script by your own MRU domains or from
rem -- file when it specified as script argument.
rem --
rem -- Version 1.3
rem -- By Yuri Voinov (c) 2014,2023
rem --------------------------------------------------------------

rem DNS host address
set address="127.0.0.1"

rem Check dig installed
for /f "delims=" %%a in ('where dig') do @set dig=%%a
if /I "%dig%"=="" echo Dig not found. If installed, add path to PATH environment variable. & exit 1
echo Dig found: %dig%

set arg=%1%
set dig_options="+short +time=5 +tries=1"

if defined %arg% (goto builtin) else (goto from_file)

:builtin
echo Warming up cache by MRU domains...
for %%a in (
2gis.com
2gis.kz
2gis.ru
admir.kz
adobe.com
agent.mail.ru
aimp.ru
akamai.com
akamaihd.com
akamaihd.net
akamaized.com
akamaized.net
almaty.tele2.kz
alphassl.com
aol.com
apple.com
archive.org
arin.com
arin.net
artlebedev.ru
auto.mail.ru
avast.com
avg.com
bbc.co.uk
bbc.com
bbci.co.uk
beeline.kz
beeline.ru
bing.com
blogger.com
blogspot.com
c.microsoft.com
cisco.com
clamav.net
cloudflare.com
cloudflaressl.com
cnn.com
comodo.com
crl.microsoft.com
dell.com
digicert.com
dmcdn.net
dnscrypt.org
download.microsoft.com
download.windowsupdate.com
drive.google.com
drive.mail.ru
drweb.com
e.mail.ru
ebay.com
en.wikipedia.org
entrust.com
eset.com
eset.kz
eset.ru
esetnod32.ru
facebook.com
farmanager.com
fb.com
fbcdn.net
fbcdn.net
firefox.com
forum.farmanager.com
freebsd.org
fsecure.com
gandi.net
gazeta.ru
geotrust.com
geotrust.net
get.adobe.com
getsharex.com
gismeteo.ru
globalsign.com
globessl.com
gnutls.org
google.com
google.kz
google.ru
googleapis.com
googlevideo.com
habrahabr.ru
hp.com
iana.org
ibm.com
icann.org
icq.com
ietf.org
images.metaservices.microsoft.com
imap.mail.ru
instagram.com
instantssl.com
intel.com
irr.kz
java.com
js.imgsmail.ru
kaspersky.com
kaspersky.ru
kcell.kz
kivvi.kz
krisha.kz
lady.mail.ru
lenta.ru
letsencrypt.org
libevent.org
libreoffice.org
libressl.org
libsodium.org
linkedin.com
livejournal.com
livejournal.ru
llnwd.net
lockheedmartin.com
love.mail.ru
mail.google.com
mail.ru
maps.yandex.net
mcafee.com
media.imdb.com
megaline.kz
microsoft.com
mirror.opencsw.org
mozilla.com
mozilla.org
mra.mail.ru
msn.com
munin-monitoring.org
my.mail.ru
my.telegram.org
my1.imgsmail.ru
my1.mail.ru
my2.imgsmail.ru
my2.mail.ru
my3.imgsmail.ru
my3.mail.ru
my4.imgsmail.ru
my4.mail.ru
my5.imgsmail.ru
my5.mail.ru
my6.imgsmail.ru
my6.mail.ru
my7.imgsmail.ru
my7.mail.ru
my8.imgsmail.ru
my8.mail.ru
my9.imgsmail.ru
my9.mail.ru
mycdn.me
mycdn.ru
news.bbcimg.co.uk
news.mail.ru
newsimg.bbc.net.uk
nortropgrumman.com
ntservicepack.microsoft.com
nvidia.com
nyt.com
nytimes.com
odnoklassniki.ru
ok.com
ok.ru
online.kz
opencsw.org
opendns.com
opendns.org
opennet.ru
openoffice.org
opera.com
oracle.com
otn.oracle.com
paypal.com
piriform.com
plugring.farmanager.com
portal.mail.ru
positivessl.com
privoxy.org
productactivation.one.microsoft.com
raidcall.com
rambler.ru
rapidssl.com
rapidsslonline.com
raytheon.com
reddit.com
redir.metaservices.microsoft.com
ripe.net
ru.wikipedia.org
shallalist.de
skype.com
sls.microsoft.com
snob.ru
sophos.com
sourceforge.net
squid-cache.org
squidanalyzer.darold.net
squidclamav.darold.net
squidguard.org
ssl.cloudflare.com
ssl.com
ssl.comodo.com
sslcertificate.com
ssllabs.com
ssls.com
starfieldtech.com
startssl.com
symantec.com
symantecliveupdate.com
tele2.kz
telecom.kz
telegram.me
telegram.org
tengrinews.kz
thawte.com
topgear.com
torproject.org
torstatus.blutmagie.de
translate.google.kz
translate.google.ru
turner.com
unbound.net
update.microsoft.com
urlfilterdb.com
verisign.com
vimeo.com
vimeocdn.com
vk.com
vk.me
vk.ru
vkontakte.com
vkontakte.ru
vlc.org
weather.mail.ru
web.archive.org
websense.com
wgis.com
whatsapp.com
wiki.squid-cache.org
windows.com
windowsupdate.com
windowsupdate.microsoft.com
wustat.windows.com
www.2gis.com
www.2gis.kz
www.2gis.ru
www.adobe.com
www.alphassl.com
www.apple.com
www.arin.com
www.arin.net
www.avast.com
www.avg.com
www.baidu.com
www.bbc.co.uk
www.bbc.com
www.bbci.co.uk
www.bing.com
www.cisco.com
www.clamav.net
www.cloudflare.com
www.cloudflaressl.com
www.comodo.com
www.dell.com
www.digicert.com
www.dnscrypt.org
www.download.windowsupdate.com
www.drweb.com
www.ebay.com
www.entrust.com
www.eset.com
www.eset.kz
www.eset.ru
www.esetnod32.ru
www.firefox.com
www.freebsd.org
www.fsecure.com
www.gandi.net
www.geotrust.com
www.geotrust.net
www.globalsign.com
www.globessl.com
www.hp.com
www.iana.org
www.ibm.com
www.icann.org
www.ietf.org
www.instantssl.com
www.intel.com
www.internic.net
www.java.com
www.kaspersky-labs.com
www.kaspersky-labs.ru
www.kaspersky.com
www.kaspersky.ru
www.letsencrypt.org
www.libressl.org
www.lockheedmartin.com
www.mail.ru
www.mcafee.com
www.megaline.kz
www.microsoft.com
www.mozilla.com
www.mozilla.org
www.nasa.gov
www.nortropgrumman.com
www.online.kz
www.opennet.ru
www.openssh.org
www.oracle.com
www.paypal.com
www.positivessl.com
www.rapidssl.com
www.rapidsslonline.com
www.raytheon.com
www.ripe.net
www.sophos.com
www.squid-cache.org
www.ssl.com
www.sslcertificate.com
www.ssllabs.com
www.ssls.com
www.starfieldtech.com
www.startssl.com
www.symantec.com
www.telecom.kz
www.thawte.com
www.topgear.com
www.urlfilterdb.com
www.verisign.com
ya.ru
yahoo.com
yandex.com
yandex.ru
yimg.com
youtube.com
ytimg.com
) do "%dig%" %dig_options% %%a @%address% 1>nul 2>nul
goto end

:from_file
echo Warming up cache from %1% file...
%dig% %dig_options% -f %arg% @%address% 1>nul 2>nul 

:end
echo Saving cache...
if exist unbound_cache.cmd unbound_cache.cmd -s
echo Done.

exit 0