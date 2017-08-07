#  Smaato Code Challenge Network Library

This small library defines model and networking layer of the Smaato iOS Code Challenge solution.

## Requirements

 1. SDK: iOS 9 (tested with iOS 9 and iOS 11 simulators).
 2. Xcode: tested with Xcode 9 beta

## Main Imports:

- [`SMAModel.h`](./SMAModel.h) : contains model classes, descendants of `SMAObject`
- [`SMANetwork.h`](.SMANetwork.h) : contains the network classes.

## Using the library

Use `SMANetworkManager` to access the API. For example, to retrieve the questions list:

        SMANetworkManager *manager = [SMANetworkManager new];
        [manager retrieveQuestionsAndThen:^(SMANetworkRequestResult * _Nonnull results) {
        
            // either results.error contains an error, or results.result contains data
        
        }];
        
## Tests

See also tests in the `SMAChallenge` app.

