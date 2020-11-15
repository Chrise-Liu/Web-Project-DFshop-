import smtplib
from email.mime.text import MIMEText

def send_mail(username,orderid,cus_mail):
    strSmtp = "smtp.gmail.587"
    strAccount = "dfshop159@gmail.com"
    strPassword = "159dfshop"

    content = "親愛的%s 先生/小姐 您好，我們已經收到您的訂單。\n" \
              "您的訂單編號為%d，若對於訂單有任何疑問，請持訂單編號至我們的網站查詢，謝謝。"% (username,orderid)
    msg = MIMEText(content)
    msg['Subject'] = '一間果乾小舖，訂單成立通知。'
    mailto = '%s'% cus_mail

    server = smtplib.SMTP(strSmtp)
    server.ehlo()
    server.starttls()
    try:
        server.login(strAccount,strPassword)
        server.sendmail(strAccount,mailto,msg.as_string())
    except:
        text = '寄件失敗'
    server.quit()