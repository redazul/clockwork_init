import subprocess
from subprocess import PIPE



output = subprocess.run(['pgrep', 'solana'], stdout=PIPE).stdout.splitlines()

print(len(output))
print(output)

if len(output) < 2:
    print("solana validator or system tuner is not running")
    print("re-starting validator")
    subprocess.call(['python3', 'sendMail.py'])
    subprocess.call(['sh', './validator.sh'])

else:
    print("validator is active")
