#import <Foundation/Foundation.h>
#import <stdatomic.h>

int main(int argc, const char * argv[]) {
    __block int c = 0;
    
    @autoreleasepool {
        id queue = [NSOperationQueue new];
        for(int i = 0; i < 10000; i++) {
            [queue addOperationWithBlock:^{
                atomic_fetch_add((_Atomic(int)*)&c, 1);
                usleep(500);
            }];
        }
        while(c < 10000) {;}
        NSLog(@"finish: %d", c);
    }
    return 0;
}
