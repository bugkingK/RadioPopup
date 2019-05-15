//
//  RadioPopupVC.h
//  WebEye
//
//  Created by moon on 15/05/2019.
//

#import <UIKit/UIKit.h>

@interface RadioPopupVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

typedef void (^CONFIRM_EVENT)(NSInteger row);

@property (weak, nonatomic) IBOutlet UIView *m_vcContent;
@property (weak, nonatomic) IBOutlet UIButton *m_btnBackClose;
@property (weak, nonatomic) IBOutlet UIButton *m_btnClose;
@property (weak, nonatomic) IBOutlet UIButton *m_btnConfirm;

// 제목이 필요하다면 사용하세용
@property (weak, nonatomic) IBOutlet UIView *m_vwTitle;
@property (weak, nonatomic) IBOutlet UILabel *m_lbTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *m_lyTitleTop;

@property (weak, nonatomic) IBOutlet UITableView *m_tvMain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *m_lyTvHeight;

- (id)initWithRadioDatas:(NSArray *)datas defaultRow:(NSInteger)defaultRow confirmEvent:(CONFIRM_EVENT)event;
- (id)initWithRadioDatas:(NSArray *)datas defaultRow:(NSInteger)defaultRow titleName:(NSString *)titleName confirmEvent:(CONFIRM_EVENT)event;

@end
