from paramiko import SSHClient
import paramiko
import time

try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False

class sshClient:
        ROBOT_LIBRARY_SCOPE = "SUITE"

        def __init__(self):
            self.__connect()

        def __connect(self):
            try:
                self.client = SSHClient()
                self.client.load_system_host_keys()
                self.client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
                self.client.connect('admmtst',username='spsy',password='Iberdrola1!')
            except AuthenticationException as error:
                print('Authentication Failed: Please check your system')
            finally:
                return self.client

        def Disconnect(self):
            self.client.close()

        def Exec_Command(self, command):
            self.client == self.__connect()
            channel = self.client.invoke_shell()
            channel.send(command)
            time.sleep(3)
