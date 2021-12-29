# theMovieDB

This app was created under the principles of Clean Architecture

I got inspired a lot in the Hexagonal Architecture, that's why I decided to modularize the app in 3 layers:

**(dependency rule is explained at the end of the readme)**

## theMovieDB: basically the presentation layer
this module is the main app module, inside of it we find an implementation of the MVVM design pattern! So of course it contains all related to UI stuff like Views/ViewControllers, UI extensions, specific UI frameworks and the ViewModels.
As we know MVVM is known because of its binding, so I decided to use RxSwift to bind ViewModels with Views, I also use RxSwift to update models when calling a service, but I'm going to talk about it later.

## Domain: it describes itself😅
this one is all about MY business logic, the business logic of the app. Inside of this module we have independent and reusable UseCases (i called them interactors) that are responsible of executing an specific action, for example: GetPopularMoviesUseCase as it says, it gives me a list of popular movies.

Besides the UseCases we can also find a folder call "Models" that are my domain models, nothing related to API Models, indeed, APIModels are mapped into domain models that we use in the entire Domain/App module.

finally, we have here the contract of the repositories, domain needs to know about them, because it asks them for data, but it cannot know about implementation details because of the dependency rule (explained later), that's why it only knows the abstraction but the implementation is up to the data layer

## Data: data access and networking detail specific
you're maybe wondering, why you have networking specific details here?
yeah, i'm maybe agree with you. If we were implementing an hexagonal architecture, this would be inside of an infrastructure module or something like that, and if you google about clean architecture implementations in mobile platforms you can find out that we could've introduced another layer: the framework layer.

not implementing a framework layer was a personal choice, it is a small app and create another module and maintaining it, takes time, but makes a lot of sense put networking specific details into it!

well, having spoken about that! let's see what's inside my data module (many things in here):

i decided to implement a repository pattern to provide data to my useCases, so we can find repositories in this module
since the repository pattern has many dataSources inside of it to provide the data we need, we can also find 'Remote and LocalDataSources' (spoiler alert: you're just gonna find remoteDataSources xD)

* the APIModels: they obviously represent API JSON objects
* a couple of enums called 'MyEnumEndpoints'. this is really interesting... i was thinking about implementing something like Moya without implementing Moya xd, and I found something really cool Alamofire has: URLRequestConvertible, later I found out that exists a pattern called 'Router'

well, let's start by URLRequestConvertible: this thing is a protocol that can be used alongside an enum where we define everything we need to call a API service, so we define a path, the HTTPMethod, the params and even the way we want to encode that params😳, really awesome, i know. the only thing URLRequestConvertible asks us to conform is a func called: asURLRequest() that returns a URLRequest with EVERYTHING the request need to be executed, love you Alamofire

so yeah, besides the endpoints enums and the API models the last thing we can find in here is my HTTPClient which is basically the class that let us make requests to a backend and consuming any API (RxSwift is used from here to make async calls in the entire app)

to finish this readme I would like to tell you how is the flow in the app and how layers communicate between them:

![Screen Shot 2021-12-29 at 2 10 19 AM](https://user-images.githubusercontent.com/37129888/147636394-7c645f82-733a-403e-a11a-b7e73bb53f60.png)

* it starts when you open the app, in the viewDidLoad() the view trigger a call to the viewModel to fetch all the movies and tvShows (view holds its respective viewModel)
* the viewModel holds the interactors or interactors that it needs and then execute the useCase needed
* we didnt talk about the dependency rule between layers yet, but Domain layer is the most inner layer of the architecture and it cannot know anything about other layers, so that's why it only contains the contracts (protocols) of the repository. 
* knowing this, our interactor asks for data from its repository and the repository, depends on the logic it has inside ask to a dataSource and give us the information we need
* once we got the info, the info flows back and in the viewModel we use a 'PublishSubject' to send events to the view, events like: we finish to retrieve the data, or that the view should show/hide a loading indicator
* publishSubject is a private property so the holder (the view) cannot send events randomly, we expose it to the view through a func and we subscribe to it from the view to listen the events the viewModel send to us!

**im really sorry about not talking about the dependency rule at the beginning, but this is basically what im talking about:**

![Screen Shot 2021-12-29 at 1 49 26 AM](https://user-images.githubusercontent.com/37129888/147634978-60999583-8f16-4ae2-b51a-766eca1770cc.png)

![Screen Shot 2021-12-29 at 2 01 46 AM](https://user-images.githubusercontent.com/37129888/147635788-ae2467c5-5995-4715-8608-8140259ef4ff.png)

as we can see the dependency rules comes from the outside to the inside of the circle, being our presentation layer and our framework/infrastructure layers the outer ones, they can know domain and data, and data can also know domain, but domain only knows domain, that why we invert dependencies having the contract of the repositories in here but the implementation of them in our Data layer, this way we're not breaking the dependency rule!

sorry if the content is bad structured I'll reorginized later!

hope you didnt get bored reading this😅, grettings,

Andrés




