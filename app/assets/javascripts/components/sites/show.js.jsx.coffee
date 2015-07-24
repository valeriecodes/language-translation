@SitesShowBox = React.createClass
  getInitialState: ->
    site: @props.site
    post: @props.post
    volunteers: @props.volunteers
    contributors: @props.contributors
  handleVolunteerAddition: (userdata) ->
    userdata.act = "volunteer"
    userdata.site_id = @state.site.id
    add_role_url = '/sites/add_role.json'
    $.ajax({
      url: add_role_url
      dataType: 'json'
      type: 'POST'
      data: userdata
      success: ((data) ->
        @setState({volunteers: data.sites}) #'data' is in form {sites: Array[n]}
      ).bind(this)
      error: ((xhr, status, err) ->
        console.error(add_role_url, status, err.toString())
      ).bind(this)
    })
  handleContributorAddition: (userdata) ->
    userdata.act = "contributor"
    userdata.site_id = @state.site.id
    add_role_url = '/sites/add_role.json'
    $.ajax({
      url: add_role_url
      dataType: 'json'
      type: 'POST'
      data: userdata
      success: ((data) ->
        @setState({contributors: data.sites}) #'data' is in form {sites: Array[n]}
      ).bind(this)
      error: ((xhr, status, err) ->
        console.error(add_role_url, status, err.toString())
      ).bind(this)
    })
  handleRoleRemoval: (userdata) ->
    userdata.site_id = @state.site.id
    remove_role_url = '/sites/remove_role.json'
    $.ajax({
      url: remove_role_url
      dataType: 'json'
      type: 'POST'
      data: userdata
      success: ((data) ->
        if(userdata.act == 'volunteer')
          @setState({volunteers: data.sites}) #'data' is in form {sites: Array[n]}
        else if(userdata.act == 'contributor')
          @setState({contributors: data.sites}) #'data' is in form {sites: Array[n]}
      ).bind(this)
      error: ((xhr, status, err) ->
        console.error(remove_role_url, status, err.toString())
      ).bind(this)
    })
  render: ->
    `<div className="SitesShowBox">
      <h1>{this.state.site.name} <span className="h4">{this.state.post.installation}</span></h1>
      <br/>
      <VolunteersList data={this.state.volunteers} onRoleAddition={this.handleVolunteerAddition} onRoleRemoval={this.handleRoleRemoval}/>
      <ContributorsList data={this.state.contributors} onRoleAddition={this.handleContributorAddition} onRoleRemoval={this.handleRoleRemoval}/>
    </div>`

@VolunteersList = React.createClass
  handleRoleAddition: ->
    @props.onRoleAddition({username: React.findDOMNode(@refs.username).value.trim(), action: "", site_id: -1})
    React.findDOMNode(@refs.username).value = ''
  handleRoleRemoval: (data) ->
    data.act = 'volunteer'
    @props.onRoleRemoval(data)
  render: ->
    clickRemoval = @handleRoleRemoval
    userNodes = @props.data.map((user) ->
      `<ShowUserNode key={user.id} user={user} onRoleRemoval={clickRemoval}/>`)
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
    @props.onRoleAddition({username: React.findDOMNode(@refs.username).value.trim(), act: "", site_id: -1})
    React.findDOMNode(@refs.username).value = ''
  handleRoleRemoval: (data) ->
    data.act = 'contributor'
    @props.onRoleRemoval(data)
  render: ->
    clickRemoval = @handleRoleRemoval
    userNodes = @props.data.map((user) ->
      `<ShowUserNode key={user.id} user={user} onRoleRemoval={clickRemoval}/>`)
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
    @props.onRoleRemoval({user_id: @props.user.id, act: "", site_id: -1})
  render: ->
    show_url = "/members/" + @props.user.id
    `<li className="UserNode">
        <a className="h4" href={show_url}>{this.props.user.first_name} {this.props.user.last_name} </a>
        <span className="h6">{this.props.user.username}</span>
        <span className="glyphicon glyphicon-remove" onClick={this.handleRoleRemoval}></span>
    </li>`