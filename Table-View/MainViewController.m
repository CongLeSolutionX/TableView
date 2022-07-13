//
//  ViewController.m
//  Table-View
//
//  Created by Cong Le on 7/7/22.
//

#import "MainViewController.h"
@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView = [[UITableView alloc] init];
  self.tableView.frame = self.view.bounds; // makes the table view expands entire the window screen
  
  self.tableView.dataSource = self;
  self.tableView.delegate = self;

  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
  [self.tableView reloadData];
  [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

  static NSString *cellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
  attachment.image = [UIImage imageNamed:@"help.jpeg"];
  attachment.bounds = CGRectMake(0, 0, 30, 30);
  NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
    cell.textLabel.attributedText = attachmentString;
  return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  printf("you pressed me\n");
}
@end
