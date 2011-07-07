//
//  TableViewController.m
//  PartialTable
//
//  Created by Abizer Nasir on 07/07/2011.
//

#import "TableViewController.h"

@interface TableViewController ()

- (void)increaseNumberOfItemsToDisplay;

@end


@implementation TableViewController

@synthesize items;

// Mark: -
// Mark: Set up and tear down

- (id)init  {
	// New designated initialiser
    if (!(self = [super initWithStyle:UITableViewStylePlain])) {
        return nil; // Bail!
    }
    numberOfItemsToDisplay = 10; // Show 10 items at startup
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
    return numberOfItemsToDisplay + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ItemCell";
    static NSString *ButtonIdentifier = @"ButtonIdentifier";
    
    // If the indexPath is less than the numberOfItemsToDisplay, configure and return a normal cell,
    // otherwise, replace it with a button cell.
    
    NSUInteger indexPathRow = [indexPath row];
    UITableViewCell *cell;
    
    if (indexPathRow < numberOfItemsToDisplay) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        cell.textLabel.text = [items objectAtIndex:[indexPath row]];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:ButtonIdentifier];
        if (!cell) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ButtonIdentifier] autorelease];
            
            UIButton *cellButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            cellButton.frame = cell.bounds;
            [cellButton setTitle:@"Next 10 items…" forState:UIControlStateNormal];
            
            [cell addSubview:cellButton];
        }
    }
    
    return cell;
}

// Mark: -
// Mark: Class extension methods

- (void)increaseNumberOfItemsToDisplay {
    NSUInteger totalNumberOfItems = [items count];
    
    if (numberOfItemsToDisplay < (totalNumberOfItems - 10)) {
        numberOfItemsToDisplay += 10;
    } else {
        numberOfItemsToDisplay = totalNumberOfItems;
    }
}

@end
