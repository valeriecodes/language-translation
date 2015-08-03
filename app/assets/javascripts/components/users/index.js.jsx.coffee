@UsersIndexBox = React.createClass
  getInitialState: ->
    users: @props.users
    organizations: @props.organizations
    admins: @props.admins
    volunteers: @props.volunteers
    contributors: @props.contributors
  handleUserApproval: (userdata) ->
    approveurl = 'members/approve.json'
    disapproveurl = 'members/disapprove.json'
    if userdata.action == 'approve'
      $.ajax({
        url: approveurl
        dataType: 'json'
        type: 'POST'
        data: {user_id: userdata.user_id}
        success: ((data) ->
          @setState({users: data.users})).bind(this)
        error: ((xhr, status, err) ->
          console.error(approveurl, status, err.toString())).bind(this)
      })
    else if userdata.action == 'disapprove'
      $.ajax({
        url: disapproveurl
        dataType: 'json'
        type: 'POST'
        data: {user_id: userdata.user_id}
        success: ((data) ->
          @setState({users: data.users})).bind(this)
        error: ((xhr, status, err) ->
          console.error(disapproveurl, status, err.toString())).bind(this)
      })
  render: ->
    users = @state.users
    organizations = @state.organizations
    admins = @state.admins
    volunteers = @state.volunteers
    contributors = @state.contributors

    `<div className="UsersIndexBox">
      <h3>Members</h3>
      <UsersIndexList users={users} organizations={organizations} admins={admins} volunteers={volunteers}
        contributors={contributors} onUserApproval={this.handleUserApproval}/>
    </div>`


@UsersIndexList = React.createClass
  handleApproval: (data) ->
    @props.onUserApproval(data)
  render: ->
    clickApproval = @handleApproval
    organizations = @props.organizations
    admins = @props.admins
    volunteers = @props.volunteers
    contributors = @props.contributors
    userNodes = @props.users.map((user) ->
      organization = organizations[user.organization_id - 1]
      role =
        if (admins.indexOf(user.id) > -1) then 'Admin'
        else if (volunteers.indexOf(user.id) > -1) then 'Volunteer'
        else if (contributors.indexOf(user.id) > -1) then 'Contributor'
        else 'Guest'
      `<UserNode key={user.id} user={user} organization={organization} role={role} onUserApproval={clickApproval}/>`)

    `<table className="UserIndexList table table-striped">
      <thead>
        <tr>
          <th>Organization</th>
          <th>Name</th>
          <th>Gender</th>
          <th>Email</th>
          <th>Username</th>
          <th>Location</th>
          <th>Language</th>
          <th>Mobile</th>
          <th>Role</th>
          <th>Login Approval</th>
        </tr>
      </thead>
      <tbody>{userNodes}</tbody>
    </table>`


@UserNode = React.createClass
  handleApproval: ->
    user = @props.user
    if user.login_approval_at
      @props.onUserApproval({user_id: user.id, action: 'disapprove'})
    else
      @props.onUserApproval({user_id: user.id, action: 'approve'})
  render: ->
    login_approval =
      if @props.user.login_approval_at
      then  `<div>{this.props.user.login_approval_at.slice(0,10)}<button onClick={this.handleApproval} className='btn btn-default'><span className='glyphicon glyphicon-remove' /></button></div>`
      else `<div>Waiting<button onClick={this.handleApproval} className='btn btn-default'><span className='glyphicon glyphicon-ok' /></button></div>`
    show_url = "members/" + @props.user.id

    `<tr>
      <td>{this.props.organization.name}</td>
      <td><a href={show_url}>{this.props.user.first_name} {this.props.user.last_name}</a></td>
      <td>{this.props.user.gender}</td>
      <td>{this.props.user.email}</td>
      <td>{this.props.user.username}</td>
      <td>{this.props.user.location}</td>
      <td>{this.props.user.lang}</td>
      <td>{this.props.user.contact}</td>
      <td>{this.props.role}</td>
      <td>{login_approval}</td>
    </tr>`
