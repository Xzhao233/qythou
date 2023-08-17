/*
qythou.cpp
qythou launcher
*/
// 一个接受一个参数的C++文件

#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
using namespace std;
int main(int argc, char* argv[]) {
  // 检查参数个数是否为2
  if (argc != 2) {
    cout << "Usage: " << argv[0] << " xxx.qy" << endl;
    return 1;
  }
  // 打开qy文件
  ifstream infile(argv[1]);
  if (!infile) {
    cout << "Cannot open file: " << argv[1] << endl;
    return 2;
  }
  // 创建一个__qytemp__.py文件
  ofstream outfile("__qytemp__.py");
  if (!outfile) {
    cout << "Cannot create file: __qytemp__.py" << endl;
    return 3;
  }
  // 在qy文件的最上面一行加上一句from qythou import *
  outfile << "from qythou import *" << endl;
  // 复制qy文件的其余内容到__qytemp__.py文件
  string line;
  while (getline(infile, line)) {
    outfile << line << endl;
  }
  // 关闭文件
  infile.close();
  outfile.close();
  // 运行__qytemp__.py文件
  system("python -B __qytemp__.py && del __qytemp__.py");
  // 在这行代码动了手脚，-B表示不产生pyc，&& del __qytemp__.py表示执行完删除__qytemp__.py
  return 0;
}
