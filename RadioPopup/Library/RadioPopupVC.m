//
//  RadioPopupVC.m
//  WebEye
//
//  Created by moon on 15/05/2019.
//

#import "RadioPopupVC.h"

@interface RadioPopupCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btnRadio;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@end
@implementation RadioPopupCell
@end


@implementation RadioPopupVC {
    NSArray *m_radioDatas;
    NSInteger m_nSelectedRow;
    BOOL m_bIsInit;
    NSMutableArray *m_btnsRadio;
    NSString *m_strTitle;
    CONFIRM_EVENT m_confirmEvent;
}

- (id)initWithRadioDatas:(NSArray *)datas defaultRow:(NSInteger)defaultRow confirmEvent:(CONFIRM_EVENT)event
{
    self = [super init];
    if (self) {
        UIStoryboard *sb_root = [UIStoryboard storyboardWithName:@"Popup" bundle:nil];
        self = [sb_root instantiateViewControllerWithIdentifier:@"RadioPopupVC"];
        m_radioDatas = datas;
        m_nSelectedRow = defaultRow;
        m_bIsInit = false;
        m_btnsRadio = [[NSMutableArray alloc] init];
        m_strTitle = @"";
        m_confirmEvent = event;
    }
    return self;
}

- (id)initWithRadioDatas:(NSArray *)datas defaultRow:(NSInteger)defaultRow titleName:(NSString *)titleName confirmEvent:(CONFIRM_EVENT)event
{
    self = [super init];
    if (self) {
        UIStoryboard *sb_root = [UIStoryboard storyboardWithName:@"Popup" bundle:nil];
        self = [sb_root instantiateViewControllerWithIdentifier:@"RadioPopupVC"];
        m_radioDatas = datas;
        m_nSelectedRow = defaultRow;
        m_bIsInit = false;
        m_btnsRadio = [[NSMutableArray alloc] init];
        m_strTitle = titleName;
        m_confirmEvent = event;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.m_vcContent.layer.cornerRadius = 3;
    self.m_tvMain.dataSource = self;
    self.m_tvMain.delegate = self;
    self.m_lyTvHeight.constant = m_radioDatas.count * 44;
    
    if([m_strTitle isEqualToString:@""]) {
        [self.m_vwTitle setHidden:YES];
        [self.m_lyTitleTop setActive:NO];
    } else {
        self.m_lbTitle.text = m_strTitle;
    }
    
    self.m_btnConfirm.tintColor = UIColor.blackColor;
    self.m_btnClose.tintColor = UIColor.blackColor;
    [self.m_btnClose addTarget:self action:@selector(onClickClose) forControlEvents:UIControlEventTouchUpInside];
    [self.m_btnBackClose addTarget:self action:@selector(onClickClose) forControlEvents:UIControlEventTouchUpInside];
    [self.m_btnConfirm addTarget:self action:@selector(onClickConfirm) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClickClose {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)onClickConfirm {
    m_confirmEvent(m_nSelectedRow);
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)onClickRadioBtn:(UIButton *)sender {
    m_nSelectedRow = sender.tag;
    for(NSInteger i=0;i<m_btnsRadio.count; i++) {
        [m_btnsRadio[i] setSelected:i==sender.tag];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return m_radioDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RadioPopupCell *cell = (RadioPopupCell *)[tableView dequeueReusableCellWithIdentifier:@"RadioPopupCell"];
    cell.lbTitle.text = m_radioDatas[indexPath.row];
    [cell.btnRadio setSelected:indexPath.row == m_nSelectedRow];
    [cell.btnRadio addTarget:self action:@selector(onClickRadioBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnRadio.tag = indexPath.row;
    [m_btnsRadio addObject:cell.btnRadio];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    m_nSelectedRow = indexPath.row;
    for(UIButton *btn in m_btnsRadio) {
        [btn setSelected:indexPath.row == btn.tag];
    }
}

@end


