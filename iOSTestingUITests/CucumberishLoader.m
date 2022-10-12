//
//  CucumberishLoader.m
//  iOSTestingUITests
//
//  Created by Rajeshkumar Ayyadurai on 26/09/22.
//

#import <Foundation/Foundation.h>
#import "iOSTestingUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit(){
    [CucumberishInitializer setupCucumberish];
}
