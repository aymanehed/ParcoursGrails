package spring
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.AuthenticationSuccessHandler
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class ExampleCustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        def authorities = authentication.authorities

        if (authorities.any { it.authority == 'ROLE_ADMIN' }) {
            // Redirect administrators to /root
            defaultTargetUrl = '/root'
        } else {
            // Redirect regular users to /home
            defaultTargetUrl = '/home'
        }

        super.onAuthenticationSuccess(request, response, authentication)
    }
}
