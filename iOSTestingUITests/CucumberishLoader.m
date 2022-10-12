#import <Foundation/Foundation.h>
#import "iOSTestingUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit(){
    [CucumberishInitializer setupCucumberish];
}
