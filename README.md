# PKHTableView

A simple, lightweight, block-based wrapper around UITableView.

PKHTableView removes much of the minutiae of setting up and managing your table view data source. Pass it the data it needs when you create it and it will take care of the rest.

The concept is heavily based on the block-based table view code included in the [Clean table view code](http://www.objc.io/issue-1/table-views.html) article from issue #1 of [objc.io](http://www.objc.io). PKHTableView wraps some of those code examples in a set of classes that can be easily integrated into your project.

## Usage

First, set your view controller as your `UITableViewDelegate`. You'll still need to implement these methods when using `PKHTableView`. Next, create an instance of `PKHTableView` in your view controller, as you would with `UITableView`. 

Then, define a block to set up your table view cells. The code in this block serves as the equivalent of the `cellForRowAtIndexPath:` method.

```objective-c
PKHTableViewCellConfigureBlock configureCellBlock = ^(CustomCell *cell, MyObject *myObject) {
    cell.customCellLabel.text = myObject.name;
    cell.image = myObject.image;
};
```
As parameters to the block, pass either a `UITableViewCell` or your own custom cell class, as well as the model object to populate that cell.

Next, initialize the object and set the delegate to `self` (or whatever you'd like to use as your table view delegate):

```objective-c
self.pkhTableView = [[PKHTableView alloc] init];
self.pkhTableView.delegate = self;
```

Then call the `createTableViewWithItems:cellIdentifier:cellConfigureBlock:andCellClass` method to set up your table view with the data it needs:

```objective-c
[self.pkhTableView createTableViewWithItems:self.dataArray
                             cellIdentifier:CellIdentifier
                         cellConfigureBlock:configureCellBlock
                               andCellClass:[CustomCell class]];
```

- The `Items` parameter is a reference to the array holding your data.
- The `cellIdentifier` is a reference to a string of your choice defined in your view controller, usually like so:
```objective-c
static NSString * const CellIdentifier = @"CellIdentifier";
```
- The `cellConfigureBlock` is the block you defined previously.
- Finally, the `cellClass` is a reference to the class you are using for your table view cells. You can use your custom class, `UITableViewCell`, or `nil` for this parameter.

Finally, add the tableview to your view:

```objective-c
[self.view addSubview:self.pkhTableView];
```
And that's it!

## Notes

You need to implement the `UITableView` delegate methods as normal, but you can replace `UITableView` in the parameter definitions with `PKHTableView` to access its `itemAtIndexPath:` method.

```objective-c
- (void)tableView:(PKHTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyObject *myObject = [tableView itemAtIndexPath:indexPath];
    ...
}
```

There's also a helpful utility class called `PKHUtilities` that includes a class method to easily create a reusable date formatter.

## License

The MIT License (MIT)

Copyright (c) 2013 Patrick Hanlon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


