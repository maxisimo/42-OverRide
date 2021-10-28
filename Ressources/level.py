class Level(object):
    def __init__(self, name, password = None, ext = ".c", compiler = "gcc"):
        self.name = name
        self.flag = self.__get_flag()
        self.password = password
        self.ext = ext
        self.compiler = compiler

    def __get_flag(self):
        try:
            f = open("./" + self.name + "/flag", "r")
            flag = f.read()
            f.close()
            return flag
        except Exception as e:
            return None

    def __str__(self):
        return self.name
