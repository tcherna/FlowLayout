# FlowLayout
Example CollectionView that shows a FlowLayout bug in iOS 17

This layout generates 7 rows in fixed sized container. Rows 1 and 3 are smaller height so the flow layout resizes them and repositions all the elements that are further down. It looks like the last row wouldn't be rendered in the container using the fixed sizes so those cells are never provided to be repositioned, however, previous OS behavior was providing those cells for resize and reposition.

See the images flow-ios16 and flow-ios17 for rendered results.
