class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      path: "/createCart",
      substrings: [],
      selectedSubstring: "",
    };
  }

  render() {
    let title = "Book Store"
    let content = "Where am I?"
    const router = {
      current: () => this.state.path,
      navigate: (path, state) => {
        // http://es6-features.org/#SpreadOperator
        this.setState({ ...state, path: path })
      }
    }

    if (this.state.path === "/") {
      content = (<LogIn
        router={router}
      />)
    } else if (this.state.path === "/createCart") {
      content = (<CreateCart
        router={router}
        substrings={this.state.substrings}
      />)
    } else if (this.state.path === "/details") {
      content = (<SubstringDetailsView
        router={router}
        selectedSubstring={this.state.selectedSubstring}
      />)
    }
    return (
      <div>
        <MyToolBar
          title={title}
          router={router}
        />
        <Container maxWidth="sm">
          <div style={{ marginTop: 24, }}>
            {content}
          </div>
        </Container>
      </div>
    );
  }
}
