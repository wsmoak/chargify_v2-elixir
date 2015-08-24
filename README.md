ChargifyV2
==========

Chargify API V2 (Chargify Direct) API wrapper in Elixir

Currently supports retrieving a Call record so that you can see the details of a previous POST to the signups endpoint via an HTML form.

## Usage

Set environment variables for
`CHARGIFY_DIRECT_API_KEY` and `CHARGIFY_DIRECT_PASSWORD`

Try it:

```
$ iex -S mix
> ChargifyV2.start
> ChargifyV2.Calls.read!("<CALL_ID>")
```

Add it to your project in `mix.exs`:

```
def application do
  [...]
  applications: [:chargify_v2]
end

def deps do
  [{:chargify_v2, git: "git://github.com/wsmoak/chargify_v2-elixir.git"}]
end
```

## References

* http://www.slogsdon.com/writing-api-wrappers-with-elixir/
* https://github.com/slogsdon/mandrill-elixir
* http://elixir-lang.org/docs/v1.0/mix/Mix.Tasks.New.html
* https://github.com/edgurgel/httpoison
* https://github.com/devinus/poison
* https://docs.chargify.com/api-call
