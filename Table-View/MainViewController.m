//
//  ViewController.m
//  Table-View
//
//  Created by Cong Le on 7/7/22.
//

#import "MainViewController.h"
#import "AnotherViewController.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

- (void)setupTableView;

@end

@implementation MainViewController
- (void)viewWillAppear:(BOOL)animated {
  [self setupTableView];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)setupTableView {
  self.tableView = [[UITableView alloc] init];
  self.tableView.frame = self.view.bounds; // makes the table view expands entire the window screen

  self.tableView.dataSource = self;
  self.tableView.delegate = self;

  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
  [self.tableView reloadData];
  [self.view addSubview:self.tableView];

  self.tableView.backgroundColor = [UIColor blueColor];
}

#pragma mark - UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

  static NSString *cellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  /// Approach:
  // 1. Create a attributed string with image and text
  // 2. Tap on TableView cell and display a helft-screen view controller
  NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
  UIImage *image = [[UIImage imageNamed:@"help.jpeg"] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
  imageAttachment.image = image;
  imageAttachment.bounds = CGRectMake(0, -5, 20, 20);

  NSMutableAttributedString *attributedImageAttachment = [NSMutableAttributedString attributedStringWithAttachment:imageAttachment];

  [attributedImageAttachment addAttribute:NSForegroundColorAttributeName
                           value:[UIColor redColor]
                           range:NSMakeRange(0, attributedImageAttachment.length)];

  NSMutableAttributedString *messageToDisplay;
  messageToDisplay = [[NSMutableAttributedString alloc] initWithString:@"This is a test for image "];

  [messageToDisplay appendAttributedString:attributedImageAttachment];

  cell.textLabel.attributedText = messageToDisplay;

  UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(printMe:)];
  [cell addGestureRecognizer:tapped];
  return cell;
}

- (void)printMe:(UITapGestureRecognizer*)sender {
  printf("I am sdsdfsdf!");
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  //AnotherViewController *newView = [[AnotherViewController alloc] init];
  switch (indexPath.row) {
    case 0:
      printf("I am pressed!");
  }
}
@end
