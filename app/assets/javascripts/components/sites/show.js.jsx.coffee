@SitesShowBox = React.createClass
  getInitialState: ->
    data: @props.data
  render: ->
    `<div className="SitesShowBox">
      <h1>{this.state.data.site.name} <span className="h4">{this.state.data.post.installation}</span></h1>
      <br/>
      <VolunteersList data={this.state.data.volunteers}/>
      <ContributorsList data={this.state.data.contributors}/>
    </div>`

@VolunteersList = React.createClass
  handleRoleAddition: ->
    console.log("gotta add " + React.findDOMNode(this.refs.username).value.trim() + " as a volunteer")
  render: ->
    userNodes = @props.data.map((user) ->
      `<ShowUserNode key={user.id} user={user}/>`)
    `<div className="VolunteersList">
      <h2>Volunteers</h2>
      <ul>
        {userNodes}
        <div className="col-md-5">
          <div className="input-group">
            <input type="text" className="form-control" placeholder="New volunteer's username" ref='username'/>
            <span className="input-group-btn">
              <button onClick={this.handleRoleAddition} className="btn btn-default" type="button">Add!</button>
            </span>
          </div>
        </div>
        <br/><br/>
      </ul>
    </div>`

@ContributorsList = React.createClass
  handleRoleAddition: ->
    console.log("gotta add " + React.findDOMNode(this.refs.username).value.trim() + " as a contributor")
  render: ->
    userNodes = @props.data.map((user) ->
      `<ShowUserNode key={user.id} user={user}/>`)
    `<div className="ContributorsList">
      <h2>Contributors</h2>
      <ul>
        {userNodes}
        <div className="col-md-5">
          <div className="input-group">
            <input type="text" className="form-control" placeholder="New contributor's username" ref='username'/>
            <span className="input-group-btn">
              <button onClick={this.handleRoleAddition} className="btn btn-default" type="button">Add!</button>
            </span>
          </div>
        </div>
        <br/><br/>
      </ul>
    </div>`

@ShowUserNode = React.createClass
  handleRoleRemoval: ->
    console.log("gotta remove " + @props.user.id)
  render: ->
    show_url = "/members/" + @props.user.id
    `<li className="UserNode">
        <a className="h4" href={show_url}>{this.props.user.first_name} {this.props.user.last_name} </a>
        <span className="h6">{this.props.user.username}</span>
        <span className="glyphicon glyphicon-remove" onClick={this.handleRoleRemoval}></span>
    </li>`