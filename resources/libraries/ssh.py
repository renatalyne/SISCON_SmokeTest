from paramiko import SSHClient
import paramiko
import time

try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
except Exception:
    ROBOT = False


def Send_Command(host, username, password):
    client = SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host,username=username,password=password)
    # client.connect('dvl81ibd',username='psene',password='jS4BvgnjmCXtgnTs')
    # client.connect('admmtst',username='spsy',password='Iberdrola1!')
    print('Connection stable')

    channel = client.invoke_shell()
    channel.send("/usr/bin/sudo su - spsy\n")
    time.sleep(3)
    channel.send("bau\n")
    time.sleep(3)
    channel.send("ta /BVG/69/12Z3/DJ/Status\n")
    time.sleep(3)
    channel.send("sta on tra\n")
    time.sleep(3)
    channel.send("sta off tra\n")
    # channel.send("touch teste\n")
    # time.sleep(3)
    print(channel.recv(10000).decode("utf-8"))
    client.close()

def main():
    Send_Command()


if __name__ == "__main__":
    main()
