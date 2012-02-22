//
//  main.m
//  flight manager
//
//  Created by Жека Г on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface flights : NSObject {

    NSString *start;
    NSString *end;


}
-(void)setstart: (NSString*)start;
-(void)setend: (NSString*)end;
-(NSString*)begining;
-(NSString*)end;

@end

@implementation flights

-(void)setstart:(NSString *)s{
    start=s;
}
-(void)setend:(NSString *)e{
    end=e;
}
-(NSString*)begining{
    return start;
}
-(NSString*)end{
    return end;
}

@end







int main (int argc, const char * argv[])
{

    @autoreleasepool {
        flights *first=[[flights alloc]init];
        first=[first init];
        [first setstart:@"Kiev"];
        [first setend:@"Lviv"];
        flights *second=[[flights alloc]init];
        [second setstart:@"Krasnodar"];
        [second setend:@"Brest"];
        NSMutableArray *array=[[NSMutableArray alloc]init];
               
        NSString *path = @"/Users/mahmood1/Desktop/kk.txt";
        NSError *error;
        NSString *stringFromFileAtPath=[NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
        if (stringFromFileAtPath == nil) {
            NSLog(@"Error reading file at %@\n%@",
                  path, [error localizedFailureReason]);
        }
        
        
        NSArray *lines=[[NSArray alloc]init];
        
        lines=[stringFromFileAtPath componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n\r"]];
        
       
        
        NSArray *words=[stringFromFileAtPath componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"->\n"]];
      
    
        
        
        NSScanner *scanner;
        for(int i=0;i<(lines).count;i++){
            NSString *string=[lines objectAtIndex:i];
            NSString *result1;
            NSString *result2;
            scanner=[NSScanner scannerWithString:string];
            [scanner scanUpToString:@"->" intoString:&result1];
            [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"-> "]];
            [scanner scanUpToString:@"\n" intoString:&result2];
            flights *i=[[flights alloc]init];
            [i setstart:result1];
            [i setend:result2];
            [array addObject:i];
        }
        NSMutableArray *bbb=[[NSMutableArray alloc]init];
        for(int i=0;i<(array).count;i++){
            if([[array objectAtIndex:i] begining]!=nil){
                [bbb addObject:[array objectAtIndex:i]];
            }
            
        }
                   
        NSMutableArray *cities=[[NSMutableArray alloc]init];
        for(int i=0;i<(bbb).count;i++){
            [cities addObject:[[bbb objectAtIndex:i]begining]];
            
        }
        NSSet *set=[[NSSet alloc]initWithArray:cities];
        NSLog(@"Please, specify the star point:");
        NSLog(@"%@",set);
       
        
        
        
        NSString *choise;
        
        bool x=TRUE;
        NSMutableArray *route=[[NSMutableArray alloc]init];
        bool dobrake=FALSE;
        while (true) {
        
            char word[15]={0};
            printf("your choise: ");
            gets(word);
           
            choise=[NSString stringWithCString:word encoding:NSASCIIStringEncoding];
            
            
            for(int i=0;i<(bbb).count;i++){
                
                if([choise isEqualToString:[NSString stringWithString:[[bbb objectAtIndex:i]begining ]]]){                    
                    if (x==TRUE) {
                        [route addObject:[[bbb objectAtIndex:i]begining]];
                        x=FALSE;
                        
                        for(int i=0;i<(bbb).count;i++){
                            if([choise isEqualToString:[NSString stringWithString:[[bbb objectAtIndex:i]begining ]]]){
                                printf("possible destinations:%s\n",[[[bbb objectAtIndex:i]end ] cStringUsingEncoding:NSUTF8StringEncoding]);                            
                            }
                            
                        }
                        
                        break;
                    } else {                       
                        [route addObject:[[bbb objectAtIndex:i]begining]];
                                       
                        if ([choise isEqualToString:[NSString stringWithString:[route objectAtIndex:0]]]) {
                            
                            dobrake=TRUE;
                        } else {
                            printf("possible destinations:%s\n",[[[bbb objectAtIndex:i]end ] cStringUsingEncoding:NSUTF8StringEncoding]);
                        }
                    
                    } 
                }
            }
            //if([choise isEqualToString:[NSString stringWithString:@"0"]] || dobrake) break; 
            
        } 
                   
        NSSet *routeset=[[NSSet alloc]initWithArray:route];
        
        
        NSLog(@"Here is your route:\n%@\nand finish point is:%@",routeset,[route objectAtIndex:0]);
    
       
    
    
    
    
    }
    return 0;
}

