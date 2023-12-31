# features
 - [x] SignIn use storybook supported make contraint auto layout.
 

# Technial Stack Detail
  - MVVM
  - Clean architecture
  - UIKIT with storyboard, Swift UI Programatically: SnapKit
# How to Run
    - Setup: Xcode 14.1
    - Run setup pod with command: `pod install`
    - Open file `ImageListing.xcworkspace` use Xcode and run in Xcode

# Structure

```
.
├── AppDelegate.swift
├── Data
│   ├── Data
│   │   └── Remote
│   │       └── GiphyApi.swift
│   └── Repository
│       └── ImageListingRepository.Impl.swift
├── Domain
│   ├── Entities
│   ├── Repository
│   │   └── ImageListingRepository.swift
│   └── Usecase
│       ├── ImageListingUsecase.swift
│       └── Impl
│           └── ImageListingUsecase.Impl.swift
├── Presentation
│   ├── Favorite
│   │   ├── ViewModel
│   │   │   └── FavoriteViewModel.swift
│   │   └── Views
│   │       └── FavoriteViewController.swift
│   ├── Home
│   ├── ImageListing
│   │   ├── ViewModel
│   │   └── Views
│   │       └── ImageListingViewController.swift
│   └── SignIn
│       ├── Storybook
│       │   └── Base.lproj
│       │       └── Main.storyboard
│       ├── ViewModel
│       │   └── SignInViewModel.swift
│       └── Views
│           └── SignInViewController.swift
├── SceneDelegate.swift
```


# API doc example

```
curl --location 'api.giphy.com/v1/gifs/trending?api_key=ieLHPScKpCgvJrLApFU4FRzM3DhLWmSJ'
```

response example:
```
{
    "data": [
        {
            "type": "gif",
            "id": "gggAO9Jh4pPDIQzxGu",
            "url": "https://giphy.com/gifs/nba-golden-state-warriors-stephen-curry-steph-gggAO9Jh4pPDIQzxGu",
            "slug": "nba-golden-state-warriors-stephen-curry-steph-gggAO9Jh4pPDIQzxGu",
            "bitly_gif_url": "https://gph.is/g/ame19JJ",
            "bitly_url": "https://gph.is/g/ame19JJ",
            "embed_url": "https://giphy.com/embed/gggAO9Jh4pPDIQzxGu",
            "username": "nba",
            "source": "",
            "title": "Golden State Warriors Smh GIF by NBA",
            "rating": "g"
        }
    ]
}
```

# Ref
 - https://cocoapods.org/pods/RxSwift
 - https://github.com/SnapKit/SnapKit



# Architecture

Apply Clean Architecture + MVVM (with ViewModel used to replace the traditional ViewModel).

```
|-----------------  Layers  ------------------|
| Presentations  |  Doamin     |   Data Layer |
|:-------------------------------------------:|

|--------------------------  Actual  ---------------------------|
| Presentations  |        Doamin          |         Data        |
|:-------------------------------------------------------------:|
|  UI <--> ViewModel <--> UseCase <--> Repository <--> API/Local|
|:-------------------------------------------------------------:|
|:----       Entity         ----|----       Model      --------:|
|:-------------------------------------------------------------:|
```
![diagram-architecture](https://user-images.githubusercontent.com/13028582/192195548-69a082dc-1c78-4407-b36c-66d692cb6aa9.png)



### UI
- This is the main interface of the application. It is classified into 3 main categories as:
   - Screen
   - Epic
   - Shared UI
- UI Layout can be Stateless or Stateful depending on its intended use and scope.
- UI Layout listens to the State that ViewModel sends and displays based on that data
- With Shared UI, it is located in the `App/Presentation/Shared/` folder. Depending on the purpose of use, it comes with a ViewModel (grouped in a feature folder) or is only placed individually and uses a certain Shared ViewModel.

### ViewModel
- It aims to handle business logic for a specific view such as validation, retrieve data, ...
- ViewModel uses use-case to retrieve data or handle domain business logic
- ViewModel listens to events from UI Layout -> handles logic and returns results to UI Layout with specific State

### UseCase
- It's the main layer to handle all data business
- It's a stateless layer, so it will be constructed on demand
- A use-case usually handle one use-case of a specific epic
- A use-case can communicate with other use-cases
- All use-case **MUST** be defined with an interface (abstract class), use-case communicate with view-model through by the interface 
- Constructor in UseCases class (DI class)

### Repository
- It's imported from local framework project name *Repository*
- The main data source of app that is used by service layer
- It's a stateless layer, so it will be constructed on demand
- It contains a little bit business rules to branch data source that should be used, from client or dao
- It also handle the caching logic rules, from memory or local storage
- All repositories **MUST** be defined with an interface (abstract class), service communicate with repository through by the interface 
- Constructor in Repository class (DI class)

### API
- It's data source layer, client means data is from RestFul API and LocalStorage means data is from local storage
- API is advanced class to handle all generic calling API, retry when access token is expired and need to refresh, also for general API error handling
- LocalStorage is advanced class to handle the generic storage, save/get list or item, or even for a string or an integer

### Model
- It covers all entities in app
- Have 2 kind of models, entity and model.
- Model is belong to repository, it defines all entity's properties and support basic parsing with JSON
- Entity is belong to UI layer, it defines all utility methods of an entity

## Dependencies Injection
- There are kinds of class to support construct instance for DI is Service, ViewModel, UseCases Repository,...
- Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App
