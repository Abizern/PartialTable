//
//  TableViewController.m
//  PartialTable
//
//  Created by Abizer Nasir on 07/07/2011.
//

#import "TableViewController.h"

#define kNumberOfItemsToAdd 8

@implementation TableViewController

@synthesize items;

// Mark: -
// Mark: Set up and tear down

- (id)init  {
	// New designated initialiser
    if (!(self = [super initWithStyle:UITableViewStyleGrouped])) {
        return nil; // Bail!
    }
    numberOfItemsToDisplay = kNumberOfItemsToAdd; // Show 10 items at startup
    return self;
}


- (id)initWithStyle:(UITableViewStyle)style {
    // Call out to the new designated initialiser
    return [self init];
}


#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (numberOfItemsToDisplay == [items count]) {
        return 1;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return numberOfItemsToDisplay;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ItemCell";
    
    // If the indexPath is less than the numberOfItemsToDisplay, configure and return a normal cell,
    // otherwise, replace it with a button cell.
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.section == 0) {            
        cell.textLabel.text = [items objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment = UITextAlignmentLeft;        
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17.f];
        
    } else {
        cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Next %d items", @"The text to display to load more content"), kNumberOfItemsToAdd];
        cell.textLabel.textAlignment = UITextAlignmentCenter;
        cell.textLabel.textColor = [UIColor colorWithRed:0.196f green:0.3098f blue:0.52f alpha:1.f];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14.f];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        NSUInteger i, totalNumberOfItems = [items count];        
        NSUInteger newNumberOfItemsToDisplay = MIN(totalNumberOfItems, numberOfItemsToDisplay + kNumberOfItemsToAdd);
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];        
        
        for (i=numberOfItemsToDisplay; i<newNumberOfItemsToDisplay; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }        
        
        numberOfItemsToDisplay = newNumberOfItemsToDisplay;                
        
        [tableView beginUpdates];
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        if (numberOfItemsToDisplay == totalNumberOfItems) {
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
        }        
        [tableView endUpdates];
        
        // Scroll the cell to the top of the table
        
        NSIndexPath *scrollPointIndexPath;
        
        if (newNumberOfItemsToDisplay < totalNumberOfItems) {
            scrollPointIndexPath = indexPath;
        } else {
            scrollPointIndexPath = [NSIndexPath indexPathForRow:totalNumberOfItems-1 inSection:0];
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 200000000), dispatch_get_main_queue(), ^(void){
            [tableView scrollToRowAtIndexPath:scrollPointIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        });
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }    
}

@end