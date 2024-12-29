#ifndef DRIVER_HPP
#define DRIVER_HPP

#include "iostream"

class driver {
    public:
    driver() = default;
    driver(driver& other) = default;

    int processInput(int a, int b);

    void processModuleStart(std::string moduleName);

    void processStructStart(std::string structName);

    void processStructEnd(std::string datatype, std::string name);
};

#endif