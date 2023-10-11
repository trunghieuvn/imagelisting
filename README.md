# features
 - [x] SignIn use storybook supported make contraint auto layout.
 

# Technial Stack Detail
  - MVVM
  - Clean architecture
  - Swift UI Programatically: SnapKit
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
└── tree.txt

23 directories, 14 files

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