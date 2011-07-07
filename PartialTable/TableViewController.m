//
//  TableViewController.m
//  PartialTable
//
//  Created by Abizer Nasir on 07/07/2011.
//

#import "TableViewController.h"

#define kNumberOfItemsToAdd 9

@implementation TableViewController

@synthesize items;

// Mark: -
// Mark: Set up and tear down

- (id)init  {
	// New designated initialiser
    if (!(self = [super initWithStyle:UITableViewStylePlain])) {
        return nil; // Bail!
    }
    numberOfItemsToDisplay = kNumberOfItemsToAdd; // Show 10 items at startup
    return self;
}


- (id)initWithStyle:(UITableViewStyle)style {
    // Call out to the new designated initialiser
    return [self init];
}

- (void)dealloc {
    [items release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (numberOfItemsToDisplay < [items count]) {
        return numberOfItemsToDisplay + 1;
    } else {
        return numberOfItemsToDisplay;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ItemCell";
    
    // If the indexPath is less than the numberOfItemsToDisplay, configure and return a normal cell,
    // otherwise, replace it with a button cell.
    
    NSUInteger indexPathRow = [indexPath row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if (indexPathRow < numberOfItemsToDisplay) {            
        cell.textLabel.text = [items objectAtIndex:[indexPath row]];
        cell.textLabel.textAlignment = UITextAlignmentLeft;        
    } else {
        cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Next %d items", @"The text to display to load more content"), kNumberOfItemsToAdd];
        cell.textLabel.textAlignment = UITextAlignmentRight;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == numberOfItemsToDisplay) {
        NSUInteger i, totalNumberOfItems = [items count];        
        NSUInteger newNumberOfItemsToDisplay = MIN(totalNumberOfItems, numberOfItemsToDisplay + kNumberOfItemsToAdd);
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];        
        
        for (i=numberOfItemsToDisplay+1; i<newNumberOfItemsToDisplay; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:indexPath.section]];
        }        
        
        [tableView beginUpdates];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        if (newNumberOfItemsToDisplay < totalNumberOfItems)
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:i inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationTop];            
        numberOfItemsToDisplay = newNumberOfItemsToDisplay;
        [tableView endUpdates];        
        [indexPaths release];        
        
        // Scroll the cell to the top of the table
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }    
}

@end