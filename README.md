Illustrates that the from_bottom styler on iOS 7 gets the wrong answer. The first time
the style is applied, it's from the stylesheet and applies:

```
st.from_bottom = PADDING
```

The button is offscreen to the bottom. Clicking the button at the top applies a style
that works like:

```
st.from_bottom = 64 + PADDING
```

which moves it way into the view. Clicking the button at the top again applies a style
like:

```
st.from_bottom = 64 + PADDING
```

which then works. It's possible that the view doesn't have the edge insets correctly
calculated in `viewDidLoad`.

There may be something wrong with my code, but this is what appears to illustrate the
problem.
