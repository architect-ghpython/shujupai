import requests
import re
import os
from subprocess import call

jia=[0]
IDM= "i_dm\\IDM\\IDMan.exe"
def kuke():
    url1="https://www.udparty.com/index.php/index/index"

    
    url = 'https://www.udparty.com/index.php/Index/loginajax'#网址
    username=input("请输入用户名/手机号:")
    password=input("请输入密码:")
    data = {'username': username,  'password': password}    
    headers1 = {        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36','refer':'https://www.udparty.com' }
   
    session1 = requests.session()
    ssss1=session1.get(url=url1, headers=headers1)
    session = requests.session()
    cookie_jar1 = ssss1.cookies
    print(cookie_jar1)
    cookie_t1 = requests.utils.dict_from_cookiejar(cookie_jar1)    
    headers = {        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36','refer':'https://www.udparty.com/index.php/index/index"' ,"cookie":"PHPSESSID="+cookie_t1.get("PHPSESSID")}
    ssss=session.post(url=url, data=data, headers=headers)
    print(ssss)
    cookie_jar = ssss.cookies
    print(cookie_jar)
    cookie_t = requests.utils.dict_from_cookiejar(cookie_jar)
    file=open('cookie.json',mode='w')
    file.write(cookie_t1.get("PHPSESSID"))
    file.close()
    print("登录成功")
    return cookie_t1 

def get():
    #kuke_=kuke()
    file=open('cookie.json',mode='r')
    kuke_='PHPSESSID='+file.read()
    print(kuke_)
    url=input("请输入课程网址(不是视频播放页，而是课程主页)")
    headers = {  'refer':'https://www.udparty.com/index.php/detail/uploadvideodetails/?id=2052&title=%E4%BA%92%E8%81%94%E7%BD%91%E5%9C%B0%E5%9B%BE%E5%B0%8F%E5%8C%BA%E6%95%B0%E6%8D%AE%E5%A4%84%E7%90%86%E5%BB%BA%E6%A8%A1%EF%BC%9A%E8%A7%A3%E6%9E%90%E3%80%81%E7%94%9F%E6%88%90%E7%9F%A2%E9%87%8F%E5%A4%9A%E8%BE%B9%E5%BD%A2%E3%80%81%E5%9D%90%E6%A0%87%E8%BD%AC%E6%8D%A2%E7%AD%89%E3%80%90%E8%A7%86%E9%A2%91%E3%80%91',      'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36','cookie':kuke_ }
    r = requests.get(url=url,headers=headers).text
    print(r)
    leng=jiexi(r)
    kk=1
    for i in leng[1]:
        url="https://www.udparty.com/index.php/detail/uploadvideolistdetails?aid="+leng[0]+"&id="+i[0]
        print (url)
        video(url,headers,kk)
        kk+=1
    call([IDM,'/s'])
        
    
def jiexi(r):
    a=re.findall("videolistdetails\?aid=(.*)\&id",r)
    print(a)
    b=re.findall("data-id=\"(.*)(\") role=\"button\"",r)
    print(b)
    jia[0]=a[0]
    return([a[0],b])

def video(url,headers,kk):
    r = requests.get(url=url,headers=headers).text
    aa=re.findall("https://(.*).mp4",r)
    print("https://"+aa[0]+".mp4")
    IDMdownload("https://"+aa[0]+".mp4","",str(kk)+".mp4")

def IDMdownload(DownUrl, DownPath, FileName):
    IDMPath = "C:\\Program Files (x86)\\Internet Download Manager"
    IDMPath="i_dm\\IDM\\"
    #os.chdir(IDMPath)
    IDM = "i_dm\\IDM\\IDMan.exe"
    current_path = os.path.abspath(__file__)
    father_path = os.path.abspath(os.path.dirname(current_path) + os.path.sep + ".")
    command = ' '.join([IDM, '/d', DownUrl,'/p',father_path+"\\video"+jia[0], '/f', FileName, '/a', '/n'])
    print(command)
    call(command)
#ss=get()
while 1:
    data = input("请输入1，2.1是填入用户名和密码 2是填入课程链接: ")
    if eval(data)==1:
        kuke()
    if eval(data)==2:
        get()

