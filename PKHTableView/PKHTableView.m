//
// PKHTableView.m
// PKHTableView
//
// Copyright (c) 2013 Patrick Hanlon
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "PKHTableView.h"

@interface PKHTableView ()

@property (nonatomic, strong) PKHDataSource *pkhDataSource;
@property (nonatomic, strong) NSMutableArray *modelObjects;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, strong) PKHTableViewCellConfigureBlock configureBlock;

@end

@implementation PKHTableView

- (void)createTableViewWithItems:(NSArray *)items cellIdentifier:(NSString *)identifier cellConfigureBlock:(PKHTableViewCellConfigureBlock)block andCellClass:(Class)cellClass
{    
    self.pkhDataSource = [[PKHDataSource alloc] initWithItems:items
                                               cellIdentifier:identifier
                                           configureCellBlock:[block copy]];
    
    self.dataSource = self.pkhDataSource;
    
    if (!cellClass) {
        cellClass = [UITableViewCell class];
    }
    [self registerClass:cellClass forCellReuseIdentifier:identifier];
    
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.pkhDataSource itemAtIndexPath:indexPath];
}


@end
