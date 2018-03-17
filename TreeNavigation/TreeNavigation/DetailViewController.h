


#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController
@property(weak,nonatomic)NSDictionary *dictData;
@property (weak, nonatomic) NSArray *listData;

@property (weak, nonatomic) NSString *url;

@property(weak,nonatomic)NSString *phone;
@property(weak,nonatomic)NSString *email;
@property(weak,nonatomic)NSString *addr;

@end
