/*

NeatUpload - an HttpModule and User Controls for uploading large files
Copyright (C) 2005  Dean Brettle

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

using System;
using System.Collections;
using System.Collections.Specialized;
using System.Reflection;
using System.Web;
using Brettle.Web.NeatUpload.Internal.Module;

namespace Brettle.Web.NeatUpload
{
	public class UploadStorage
	{
		public static UploadedFile CreateUploadedFile(UploadContext context, string controlUniqueID, string fileName,
		                                              string contentType, UploadStorageConfig storageConfig)
		{
			UploadedFile file = null;
			if (storageConfig == null || storageConfig.Count == 0)
			{
				file = Provider.CreateUploadedFile(context, controlUniqueID, fileName, contentType);
			}
		    else
			{
				file = Provider.CreateUploadedFile(context, controlUniqueID, fileName, contentType, storageConfig);
			}
			return file;
		}

		public static UploadedFile CreateUploadedFile(UploadContext context, string controlUniqueID, string fileName,
		                                              string contentType)
		{
			return CreateUploadedFile(context, controlUniqueID, fileName, contentType, null);
		}

		public static UploadStorageConfig CreateUploadStorageConfig()
		{
			return Provider.CreateUploadStorageConfig();
		}
				
		public static UploadStorageProvider Provider
		{
			get
			{
				Config config = Config.Current;
				if (config.DefaultStorageProviderName == null)
				{
					return LastResortProvider;
				}
				return config.StorageProviders[config.DefaultStorageProviderName];
			}
		}

		public static UploadStorageProviderCollection Providers
		{
			get
			{
				return Config.Current.StorageProviders;
			}
		}

		private static FilesystemUploadStorageProvider _lastResortProvider = null;
		private static object _lock = new object();
		internal static FilesystemUploadStorageProvider LastResortProvider 
		{
			get
			{
				lock (_lock)
				{
					if (_lastResortProvider == null)
					{
						_lastResortProvider = new FilesystemUploadStorageProvider();
						_lastResortProvider.Initialize("FilesystemUploadStorageProvider", new NameValueCollection());
					}
				}
				return _lastResortProvider;
			}
		}

		internal static void DisposeAtEndOfRequest(UploadedFile file)
		{
			HttpContext ctx = HttpContext.Current;
			if (ctx == null) return; // Not in an ASP.NET request, so nothing to do
						
			// Add a list of files to dispose to the current context if one hasn't been added yet
			ArrayList filesToDispose = ctx.Items["NeatUpload_FilesToDispose"] as ArrayList;
			if (filesToDispose == null)
			{
				filesToDispose = new ArrayList();
				ctx.Items["NeatUpload_FilesToDispose"] = filesToDispose;
			}
			
			// Add the file to the list of files
			filesToDispose.Add(file);
		}
		
	}
}
