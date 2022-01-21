//
//  EchoPlugin.m
//  App
//
//  Created by 中島慶樹 on 2022/01/17.
//

#import <Capacitor/Capacitor.h>

CAP_PLUGIN(EchoPlugin, "Echo",
  CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
)
