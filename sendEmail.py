import smtplib

#add info
sender='clockworkmonitor1@outlook.com'
receiver=['','']

subject="validator1 down"
body="Restarting Validator"
msg=f'To: {receiver[0]};{receiver[1]}\nSubject:{subject}\n\n{body}'

server=smtplib.SMTP('smtp-mail.outlook.com',587)
server.starttls()
#add password
server.login(sender,'')
server.sendmail(sender,receiver,msg)
print("mail sent")
