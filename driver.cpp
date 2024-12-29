#include "driver.hpp"

using namespace std;
int driver::processInput(int a ,int b) {
    cout << "Result is " << (a+b) << endl;
    return a+b;
}

void driver::processModuleStart(std::string moduleName) {
    cout << "module name is : " << moduleName << endl;
}

void driver::processStructStart(std::string structName) {
    cout << "struct name is : " << structName << endl;
}

void driver::processStructEnd(std::string datatype, std::string name) {
    cout << datatype << " " << name << endl;
}
