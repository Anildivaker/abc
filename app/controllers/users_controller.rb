class UsersController < InheritedResources::Base

	private
	def users_params 
		params.require(:user).permit(:name, :email, :mobile_number)
	end

end
