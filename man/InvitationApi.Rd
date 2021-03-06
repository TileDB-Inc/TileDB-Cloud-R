% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/invitation_api.R
\docType{class}
\name{InvitationApi}
\alias{InvitationApi}
\title{Invitation operations}
\format{
An \code{R6Class} generator object
}
\description{
tiledbcloud.Invitation
}
\section{Methods}{

\describe{
\strong{ AcceptInvitation } \emph{  }
Accepts invitation

\itemize{
\item \emph{ @param } invitation character


\item status code : 204 | Invitation was accepted successfully


\item response headers :

\tabular{ll}{
}
\item status code : 404 | Could not find invitation identifier


\item response headers :

\tabular{ll}{
}
\item status code : 0 | error response

\item return type : Error 
\item response headers :

\tabular{ll}{
}
}

\strong{ CancelJoinOrganization } \emph{  }
Cancels join organization invitation

\itemize{
\item \emph{ @param } invitation character
\item \emph{ @param } organization character


\item status code : 204 | Invitation cancelled successfully


\item response headers :

\tabular{ll}{
}
\item status code : 404 | No invitation was found to cancel


\item response headers :

\tabular{ll}{
}
\item status code : 0 | error response

\item return type : Error 
\item response headers :

\tabular{ll}{
}
}

\strong{ CancelShareArrayByInvite } \emph{  }
Cancels array sharing invitation

\itemize{
\item \emph{ @param } namespace character
\item \emph{ @param } invitation character
\item \emph{ @param } array character


\item status code : 204 | Invitation cancelled successfully


\item response headers :

\tabular{ll}{
}
\item status code : 404 | No invitation was found to cancel


\item response headers :

\tabular{ll}{
}
\item status code : 0 | error response

\item return type : Error 
\item response headers :

\tabular{ll}{
}
}

\strong{ FetchInvitations } \emph{  }
Fetch a list of invitations

\itemize{
\item \emph{ @param } organization character
\item \emph{ @param } array character
\item \emph{ @param } start integer
\item \emph{ @param } end integer
\item \emph{ @param } page integer
\item \emph{ @param } per.page integer
\item \emph{ @param } type character
\item \emph{ @param } status character
\item \emph{ @param } orderby character
\item \emph{ @returnType } \link{InvitationData} \cr


\item status code : 200 | List of invitations and pagination metadata

\item return type : InvitationData 
\item response headers :

\tabular{ll}{
}
\item status code : 0 | error response

\item return type : Error 
\item response headers :

\tabular{ll}{
}
}

\strong{ JoinOrganization } \emph{  }
Sends email to multiple recipients with joining information regarding an organization

\itemize{
\item \emph{ @param } organization character
\item \emph{ @param } email.invite \link{InvitationOrganizationJoinEmail}


\item status code : 204 | Email sent successfully to user for email confirmation link


\item response headers :

\tabular{ll}{
}
\item status code : 404 | Could not reach one or more recipients

\item return type : InvitationOrganizationJoinEmail 
\item response headers :

\tabular{ll}{
}
\item status code : 0 | error response

\item return type : Error 
\item response headers :

\tabular{ll}{
}
}

\strong{ ShareArrayByInvite } \emph{  }
Sends email to multiple recipients with sharing information regarding an array

\itemize{
\item \emph{ @param } namespace character
\item \emph{ @param } array character
\item \emph{ @param } email.invite \link{InvitationArrayShareEmail}


\item status code : 204 | Email sent successfully to user for email confirmation link


\item response headers :

\tabular{ll}{
}
\item status code : 404 | Could not reach one or more recipients

\item return type : InvitationArrayShareEmail 
\item response headers :

\tabular{ll}{
}
\item status code : 0 | error response

\item return type : Error 
\item response headers :

\tabular{ll}{
}
}

}
}

\examples{
\dontrun{
####################  AcceptInvitation  ####################

library(tiledbcloud)
var.invitation <- 'invitation_example' # character | the id of invitation about to be accepted

api.instance <- InvitationApi$new()

#Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';

#Configure HTTP basic authorization: BasicAuth
# provide your username in the user-serial format
api.instance$apiClient$username <- '<user-serial>'; 
# provide your api key generated using the developer portal
api.instance$apiClient$password <- '<api_key>';

result <- api.instance$AcceptInvitation(var.invitation)


####################  CancelJoinOrganization  ####################

library(tiledbcloud)
var.invitation <- 'invitation_example' # character | the id of invitation about to be cancelled
var.organization <- 'organization_example' # character | name or uuid of organization

api.instance <- InvitationApi$new()

#Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';

#Configure HTTP basic authorization: BasicAuth
# provide your username in the user-serial format
api.instance$apiClient$username <- '<user-serial>'; 
# provide your api key generated using the developer portal
api.instance$apiClient$password <- '<api_key>';

result <- api.instance$CancelJoinOrganization(var.invitation, var.organization)


####################  CancelShareArrayByInvite  ####################

library(tiledbcloud)
var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.invitation <- 'invitation_example' # character | the id of invitation about to be cancelled
var.array <- 'array_example' # character | name/uri of array that is url-encoded

api.instance <- InvitationApi$new()

#Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';

#Configure HTTP basic authorization: BasicAuth
# provide your username in the user-serial format
api.instance$apiClient$username <- '<user-serial>'; 
# provide your api key generated using the developer portal
api.instance$apiClient$password <- '<api_key>';

result <- api.instance$CancelShareArrayByInvite(var.namespace, var.invitation, var.array)


####################  FetchInvitations  ####################

library(tiledbcloud)
var.organization <- 'organization_example' # character | name or id of organization to filter
var.array <- 'array_example' # character | name/uri of array that is url-encoded to filter
var.start <- 56 # integer | start time for tasks to filter by
var.end <- 56 # integer | end time for tasks to filter by
var.page <- 56 # integer | pagination offset
var.per.page <- 56 # integer | pagination limit
var.type <- 'type_example' # character | invitation type, \"ARRAY_SHARE\", \"JOIN_ORGANIZATION\"
var.status <- 'status_example' # character | Filter to only return \"PENDING\", \"ACCEPTED\"
var.orderby <- 'orderby_example' # character | sort by which field valid values include timestamp, array_name, organization_name

api.instance <- InvitationApi$new()

#Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';

#Configure HTTP basic authorization: BasicAuth
# provide your username in the user-serial format
api.instance$apiClient$username <- '<user-serial>'; 
# provide your api key generated using the developer portal
api.instance$apiClient$password <- '<api_key>';

result <- api.instance$FetchInvitations(organization=var.organization, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, status=var.status, orderby=var.orderby)


####################  JoinOrganization  ####################

library(tiledbcloud)
var.organization <- 'organization_example' # character | name or uuid of organization
var.email.invite <- InvitationOrganizationJoinEmail$new() # InvitationOrganizationJoinEmail | list of email recipients

api.instance <- InvitationApi$new()

#Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';

#Configure HTTP basic authorization: BasicAuth
# provide your username in the user-serial format
api.instance$apiClient$username <- '<user-serial>'; 
# provide your api key generated using the developer portal
api.instance$apiClient$password <- '<api_key>';

result <- api.instance$JoinOrganization(var.organization, var.email.invite)


####################  ShareArrayByInvite  ####################

library(tiledbcloud)
var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
var.array <- 'array_example' # character | name/uri of array that is url-encoded
var.email.invite <- InvitationArrayShareEmail$new() # InvitationArrayShareEmail | list of email recipients

api.instance <- InvitationApi$new()

#Configure API key authorization: ApiKeyAuth
api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';

#Configure HTTP basic authorization: BasicAuth
# provide your username in the user-serial format
api.instance$apiClient$username <- '<user-serial>'; 
# provide your api key generated using the developer portal
api.instance$apiClient$password <- '<api_key>';

result <- api.instance$ShareArrayByInvite(var.namespace, var.array, var.email.invite)


}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{apiClient}}{Handles the client-server communication.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{InvitationApi$new()}}
\item \href{#method-AcceptInvitation}{\code{InvitationApi$AcceptInvitation()}}
\item \href{#method-AcceptInvitationWithHttpInfo}{\code{InvitationApi$AcceptInvitationWithHttpInfo()}}
\item \href{#method-CancelJoinOrganization}{\code{InvitationApi$CancelJoinOrganization()}}
\item \href{#method-CancelJoinOrganizationWithHttpInfo}{\code{InvitationApi$CancelJoinOrganizationWithHttpInfo()}}
\item \href{#method-CancelShareArrayByInvite}{\code{InvitationApi$CancelShareArrayByInvite()}}
\item \href{#method-CancelShareArrayByInviteWithHttpInfo}{\code{InvitationApi$CancelShareArrayByInviteWithHttpInfo()}}
\item \href{#method-FetchInvitations}{\code{InvitationApi$FetchInvitations()}}
\item \href{#method-FetchInvitationsWithHttpInfo}{\code{InvitationApi$FetchInvitationsWithHttpInfo()}}
\item \href{#method-JoinOrganization}{\code{InvitationApi$JoinOrganization()}}
\item \href{#method-JoinOrganizationWithHttpInfo}{\code{InvitationApi$JoinOrganizationWithHttpInfo()}}
\item \href{#method-ShareArrayByInvite}{\code{InvitationApi$ShareArrayByInvite()}}
\item \href{#method-ShareArrayByInviteWithHttpInfo}{\code{InvitationApi$ShareArrayByInviteWithHttpInfo()}}
\item \href{#method-clone}{\code{InvitationApi$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$new(apiClient)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-AcceptInvitation"></a>}}
\if{latex}{\out{\hypertarget{method-AcceptInvitation}{}}}
\subsection{Method \code{AcceptInvitation()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$AcceptInvitation(invitation, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-AcceptInvitationWithHttpInfo"></a>}}
\if{latex}{\out{\hypertarget{method-AcceptInvitationWithHttpInfo}{}}}
\subsection{Method \code{AcceptInvitationWithHttpInfo()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$AcceptInvitationWithHttpInfo(invitation, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-CancelJoinOrganization"></a>}}
\if{latex}{\out{\hypertarget{method-CancelJoinOrganization}{}}}
\subsection{Method \code{CancelJoinOrganization()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$CancelJoinOrganization(invitation, organization, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-CancelJoinOrganizationWithHttpInfo"></a>}}
\if{latex}{\out{\hypertarget{method-CancelJoinOrganizationWithHttpInfo}{}}}
\subsection{Method \code{CancelJoinOrganizationWithHttpInfo()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$CancelJoinOrganizationWithHttpInfo(invitation, organization, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-CancelShareArrayByInvite"></a>}}
\if{latex}{\out{\hypertarget{method-CancelShareArrayByInvite}{}}}
\subsection{Method \code{CancelShareArrayByInvite()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$CancelShareArrayByInvite(namespace, invitation, array, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-CancelShareArrayByInviteWithHttpInfo"></a>}}
\if{latex}{\out{\hypertarget{method-CancelShareArrayByInviteWithHttpInfo}{}}}
\subsection{Method \code{CancelShareArrayByInviteWithHttpInfo()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$CancelShareArrayByInviteWithHttpInfo(
  namespace,
  invitation,
  array,
  ...
)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-FetchInvitations"></a>}}
\if{latex}{\out{\hypertarget{method-FetchInvitations}{}}}
\subsection{Method \code{FetchInvitations()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$FetchInvitations(
  organization = NULL,
  array = NULL,
  start = NULL,
  end = NULL,
  page = NULL,
  per.page = NULL,
  type = NULL,
  status = NULL,
  orderby = NULL,
  ...
)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-FetchInvitationsWithHttpInfo"></a>}}
\if{latex}{\out{\hypertarget{method-FetchInvitationsWithHttpInfo}{}}}
\subsection{Method \code{FetchInvitationsWithHttpInfo()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$FetchInvitationsWithHttpInfo(
  organization = NULL,
  array = NULL,
  start = NULL,
  end = NULL,
  page = NULL,
  per.page = NULL,
  type = NULL,
  status = NULL,
  orderby = NULL,
  ...
)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JoinOrganization"></a>}}
\if{latex}{\out{\hypertarget{method-JoinOrganization}{}}}
\subsection{Method \code{JoinOrganization()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$JoinOrganization(organization, email.invite, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-JoinOrganizationWithHttpInfo"></a>}}
\if{latex}{\out{\hypertarget{method-JoinOrganizationWithHttpInfo}{}}}
\subsection{Method \code{JoinOrganizationWithHttpInfo()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$JoinOrganizationWithHttpInfo(organization, email.invite, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ShareArrayByInvite"></a>}}
\if{latex}{\out{\hypertarget{method-ShareArrayByInvite}{}}}
\subsection{Method \code{ShareArrayByInvite()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$ShareArrayByInvite(namespace, array, email.invite, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ShareArrayByInviteWithHttpInfo"></a>}}
\if{latex}{\out{\hypertarget{method-ShareArrayByInviteWithHttpInfo}{}}}
\subsection{Method \code{ShareArrayByInviteWithHttpInfo()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$ShareArrayByInviteWithHttpInfo(
  namespace,
  array,
  email.invite,
  ...
)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{InvitationApi$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
