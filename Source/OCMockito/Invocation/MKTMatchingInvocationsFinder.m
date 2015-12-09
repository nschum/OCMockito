//  OCMockito by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 Jonathan M. Reid. See LICENSE.txt

#import "MKTMatchingInvocationsFinder.h"

#import "MKTInvocation.h"
#import "MKTInvocationMatcher.h"
#import "MKTLocation.h"


@interface MKTMatchingInvocationsFinder ()
@property (nonatomic, copy) NSArray *invocations;
@end

@implementation MKTMatchingInvocationsFinder

@dynamic count;

- (void)findInvocationsInList:(NSArray *)invocations matching:(MKTInvocationMatcher *)wanted
{
    self.invocations = [invocations filteredArrayUsingPredicate:
            [NSPredicate predicateWithBlock:^BOOL(id obj, NSDictionary *bindings) {
                MKTInvocation *invocation = obj;
                return [wanted matches:invocation.invocation];
            }]];
}

- (NSUInteger)count
{
    return self.invocations.count;
}

- (NSArray *)callStackOfInvocationAtIndex:(NSUInteger)index
{
    MKTInvocation *invocation = self.invocations[index];
    return invocation.location.callStackSymbols;
}

- (MKTLocation *)locationOfInvocationAtIndex:(NSUInteger)index
{
    MKTInvocation *invocation = self.invocations[index];
    return invocation.location;
}

- (NSArray *)callStackOfLastInvocation
{
    MKTInvocation *invocation = self.invocations.lastObject;
    return invocation.location.callStackSymbols;
}

- (MKTLocation *)locationOfLastInvocation
{
    MKTInvocation *invocation = self.invocations.lastObject;
    return invocation.location;
}

@end