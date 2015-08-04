@UsersShowBox = React.createClass
  getInitialState: ->
    current_user_roles: @props.current_user_roles
    user: @props.user
    user_roles: @props.user_roles
    organization: @props.organization
  handleAdminToggle: (userdata) ->
    grant_url = '/members/grant_admin.json'
    revoke_url = '/members/revoke_admin.json'
    if userdata.action == 'grant'
      $.ajax({
        url: grant_url
        dataType: 'json'
        type: 'POST'
        data: {user_id: userdata.user_id}
        success: ((data) ->
          @setState({user_roles: data.users})).bind(this)
        error: ((xhr, status, err) ->
          console.error(grant_url, status, err.toString())).bind(this)
      })
    else if userdata.action== 'revoke'
      $.ajax({
        url: revoke_url
        dataType: 'json'
        type: 'POST'
        data: {user_id: userdata.user_id}
        success: ((data) ->
          @setState({user_roles: data.users})).bind(this)
        error: ((xhr, status, err) ->
          console.error(revoke_url, status, err.toString())).bind(this)
      })
  render: ->
    current_user_roles = @state.current_user_roles
    user = @state.user
    user_roles = @state.user_roles
    organization = @state.organization
    gender = ''
    login_approval_message =
      if user.login_approval_at then ''
      else 'The user first needs to be approved to use the account.'
    clickToggle = @handleAdminToggle

    `<div className="UsersShowBox">
      <h2>Contact Information</h2>
      <br/>
      <dl className="dl-horizontal">
        <dt>Organization</dt>
        <dd>{organization.name}</dd>

        <dt>Name</dt>
        <dd>{user.first_name} {user.last_name}</dd>

        <dt>Username</dt>
        <dd>{user.username}</dd>

        <dt>Email</dt>
        <dd>{user.email}</dd>

        <dt>Location</dt>
        <dd>{user.location}</dd>

        <dt>Language</dt>
        <dd>{user.lang}</dd>

        <dt>Contact Number</dt>
        <dd>{user.contact}</dd>

        <dt>Gender</dt>
        <dd>{user.gender}</dd>
      </dl>
      <p className="text-center"><strong>{login_approval_message}</strong></p>
      <ToggleAdminButton current_user_roles={current_user_roles} user={user} user_roles={user_roles} onToggleAdmin={clickToggle} />
    </div>`


@ToggleAdminButton = React.createClass
  handleToggle: ->
    if ('admin' in @props.user_roles)
      @props.onToggleAdmin({user_id: @props.user.id, action: 'revoke'})
    else
      @props.onToggleAdmin({user_id: @props.user.id, action: 'grant'})
  render: ->
    current_user_roles = @props.current_user_roles
    user_roles = @props.user_roles
    button_message =
      if ('admin' in user_roles) then 'Revoke Admin Rights'
      else 'Make Admin'

    if ('admin' in current_user_roles or 'superadmin' in current_user_roles)
      `<p className='text-center'>
        <button onClick={this.handleToggle} className="btn btn-default">{button_message}</button>
      </p>`
    else
      ``
