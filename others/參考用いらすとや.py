# source: https://qiita.com/japanesebonobo/items/eb374a94ed0456c88ed7
import re
import requests
import urllib.request as urlreq
from bs4 import BeautifulSoup

pages = range(1, 10000)
linkData = []

for p in pages:
    if p == 1:
        r = urlreq.Request('https://www.irasutoya.com/search/label/%E7%97%85%E6%B0%97')
        with urlreq.urlopen(r) as r:
            r = r.read()
        soup = BeautifulSoup(r, 'lxml')
        links = soup.select("a[href]")
        for a in links:
            href = a.attrs['href']
            if re.search('irasutoya.*blog-post.*html$',href):
                if not href in linkData:
                    linkData.append(href)
                    print(href)
            if re.search('max-results=20&start=20&by-date=false$',href):
                r = href
                break
        for link in linkData:
            res = requests.get(link)
            soup = BeautifulSoup(res.text, "lxml")
            links = soup.select(".separator > a")
            for a in links:
                imageLink = a.get('href')
                filename = re.search(".*\/(.*png|.*jpg)$",imageLink)
                try: 
                    urlreq.urlretrieve(imageLink,"E:/いらすとや/test_dir/"+filename.group(1))
                    print(imageLink)
                except ValueError:
                    print("ValueError!")
    else:
        r = urlreq.Request(r)
        with urlreq.urlopen(r) as r:
            r = r.read()
        soup = BeautifulSoup(r, 'lxml')
        links = soup.select("a[href]")
        for a in links:
            href = a.attrs['href']
            if re.search('irasutoya.*blog-post.*html$',href):
                if not href in linkData:
                    linkData.append(href)
                    print(href)
            if re.search('max-results=20&start='+str(p*20)+'&by-date=false$',href):
                r = href
                break
        for link in linkData:
            res = requests.get(link)
            soup = BeautifulSoup(res.text, "lxml")
            links = soup.select(".separator > a")
            for a in links:
                    imageLink = a.get('href')
                    filename = re.search(".*\/(.*png|.*jpg)$",imageLink)
                    try: 
                        urlreq.urlretrieve(imageLink,"E:/いらすとや/test_dir/"+filename.group(1))
                        print(imageLink)
                    except ValueError:
                        print("ValueError!")