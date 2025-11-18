// CUE language
package hello

message: "Hello, World!"

#Greeting: {
    name: string
    text: "Hello, \(name)!"
}

greeting: #Greeting & {
    name: "CUE"
}
