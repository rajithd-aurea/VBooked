using System.Web;
using System.Web.Optimization;

namespace EventBookingPlatform
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/template/css/css").Include(
                      "~/Content/template/css/jquery-ui.css",
                      "~/Content/template/css/customcss.css",
                      "~/Content/template/css/bootstrap.min.css",
                      "~/Content/template/css/sb-admin.css",
                      "~/Content/template/css/plugins/morris.css",
                      "~/Content/template/font-awesome/css/font-awesome.min.css"));

            bundles.Add(new ScriptBundle("~/bundles/jscript").Include(
                        "~/Content/template/js/jquery-1.11.3.js",
                        "~/Content/template/js/jquery-ui.js",
                        "~/Content/template/js/bootstrap.min.js",
                        "~/Content/template/js/plugins/morris/morris-data.js",
                        "~/Content/template/js/plugins/morris/morris.min.js",
                        "~/Content/template/js/plugins/morris/raphael.js"));
        }
    }
}
