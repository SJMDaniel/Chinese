using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HanYuLearing.Startup))]
namespace HanYuLearing
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
