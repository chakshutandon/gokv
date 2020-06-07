# GoKV_Core

Core implementation of an in-memory key-value store written in Golang.

# Writeup

The programming language Go was chosen for the implementation of the backend. Golang was chosen for its simplicity in these systems-level applications: it feels like a high-level interface that can natively do low-level things. For example, timers can easily be started as in the functions in `timer.go`. All that said, Golang does not require the user to get bogged down in declaring types for every variable and handling pointers everywhere; the compiler is able to be intelligent about type inference and enforces proper references where required. In short, as [the Golang documentation page boasts](https://golang.org/doc/), "it's a fast, statically typed, compiled language that feels like a dynamically typed, interpreted language."

## Code Formatting

One unusual feature of Go is its mandatory enforcement of correctly formatted code. For example, it will not allow the following brace style:

```golang
if condition
{
    dosomething...
}
```

Other syntax formatting differences will compile, but there is a "holy" style that is enforced by a command-line utility, `gofmt`. It is strongly recommended in the Golang community to run all code through this formatter before commiting it to version control, or even to go so far as to make it format the code on each save of your editor. Automated code formatting is a somewhat new development in programming, with the rise of other tools like Prettier in the JavaScript community. Formatting enforcement like this eshcews petty differences over brace or indentation styles and allows programmers to focus on the more pressing matters, like the high-level design of the entire system.'

## Goroutines

Golang also includes a framework for multithreading and some primitive thread-safe mechanisms right out of the box. It accomplishes this using goroutines, which are user-level threads managed by the Go runtime. A goroutine is easily made from a normal function by just writing `go func()`. To communicate between threads, channels are offered by the language. They can deliver bidirectional messages and block a thread from continuing until receiving a message. The result is lightweight concurrency that is easily implemented without the need for complicated calls to, for example, `pthread`.

## IPC

Communication between the node and the API server is done using Google's gRPC protocol for realtime systems. The formatting of the calls is implemented using Google Protocol Buffers (Protobufs), which create strict definitions for the interface used and the types of the data that are transmitted. Protobufs create data structures that can be sent over the wire in raw binary. After the necessary protocol buffers were defined, it was simple to set up a gRPC server using the official integrations made available by Google.

Implementations for the RPCs are made in `main.go`, which demonstrate how easy it is to build responses to requests that are already predefined by protobufs. The calls themselves are also abstracted away by the gRPC library, which calls for the creation of one connection object that can then be called without regard for the actual implementation. Such an example is available in the `ReadKVPRC()` function in `main.go`.

## Packaging

Go's packaging system is notably modern. The standard library, including packages like `"log"` and `"time"`, is distributed with the Go runtime, like many other languages. The interesting part comes with third-party libraries, which are indicated with fully-qualified urls. For example, the gRPC library is located at https://google.golang.org/grpc, so it must be imported as such, as in the top of `main.go`. Packages are defined externally, in `go.mod`, and locked by `go.sum`. Such a packaging system enforced at the lowest level possible -- the syntax of the language itself -- leads to reproducible builds and a more consistent ecosystem overall. Where Haskell gains a lot of its safety from its type system, Go is safe through the enforced conventions in code style and packaging.

## Deployment

Both the core node and the API are deployed via Docker. This allows for reproducible builds both in development and in production. In the case of the Go nodes, the Go runtime compiles down to a static binary with all libraries included. This means that the binary can then be run on an extremely lightweight operating system, like the one offered by BusyBox Linux and the `alpine` Docker image. Such a setup also allows for testing of networking failures and failovers using Docker's virtual networking interfaces.
