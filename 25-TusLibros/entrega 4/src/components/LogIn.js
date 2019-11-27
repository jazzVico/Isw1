class LogInComponent extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      user: "",
      password:""
    }
  }

	handleChangeUser(event) {
	    this.setState({
	      user: event.target.value

	    })
	  };

	handleChangePW(event) {
	    this.setState({
	      password: event.target.value

	    })
	  };


	render() {
		const {
		  router
		} = this.props
		const {
	      classes,
	    } = this.props




	return (
      <div >
        <Typography component="h1" gutterBottom>
          user
          </Typography>
        <FormControl fullWidth className={classes.textField} variant="outlined" >
          <InputLabel htmlFor="outlined-adornment-amount"      >username</InputLabel >
          <OutlinedInput   
           
            id="outlined-adornment-amount"
            value={this.state.user}
            onChange={(ev)=>this.handleChangeUser(ev)}
            startAdornment={<InputAdornment position="start">></InputAdornment>}
            labelWidth={60}
            multiline
            rows="7"
          />
        </FormControl>

        <Typography component="h1" gutterBottom>
          password
          </Typography>
        <FormControl fullWidth className={classes.textField} variant="outlined">
          <InputLabel htmlFor="outlined-adornment-amount">String</InputLabel>
          <OutlinedInput
            id="outlined-adornment-amount"
            value={this.state.password}
            onChange={(ev)=>this.handleChangePW(ev)}
            startAdornment={<InputAdornment position="start">></InputAdornment>}
            labelWidth={60}
            multiline
            rows="7"
          />
        </FormControl>

        <Button
          color="inherit"
          onClick={(ev)=>this.handleSend(ev)}>
          Enviar
      </Button>
      </div>
    )

	}
}

// Add style
const LogIn = withStyles(styles, {
  withTheme: true
})(LogInComponent)
